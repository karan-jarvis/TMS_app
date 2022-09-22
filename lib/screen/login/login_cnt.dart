import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tms_app/screen/login/login_screen.dart';
import 'package:tms_app/utils/prefrences/prefrences.dart';
import 'package:tms_app/utils/prefrences/prefrences_key.dart';
import 'package:tms_app/utils/route_constants.dart';
import 'package:tms_app/widget/common_button.dart';

class LoginController extends GetxController {
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;

  FocusNode emailFN = FocusNode();
  FocusNode passwordFN = FocusNode();

  String? emailError = "";
  String? passwordError = "";

  RxBool isLoading = false.obs;

  void onPressLogin(context) {
    FocusScope.of(context!).unfocus();
    checkEmail(emailController.value.text);
    checkPassword(passwordController.value.text);
    if (emailError == "" && passwordError == "") {
      isLoading.value = true;
      _signInWithEmailAndPassword(context);
    } else {
      showSnackBar(context: context, title: "Please fill the detail");
    }
  }

  void _signInWithEmailAndPassword(context) async {
    try {
      final User user = (await auth.signInWithEmailAndPassword(
        email: emailController.value.text,
        password: passwordController.value.text,
      ))
          .user!;
      log(user.email!, name: "UserMail");
      if (user.email == "admin2522@yopmail.com") {
        await AppPreference().setBool(PreferencesKey.isLogin, true);
        Get.offAllNamed(RoutesConstants.homeScreen);
      }
    } catch (e) {
      print("Error is $e");
      showSnackBar(context: context, title: "$e");
    }
    isLoading.value = false;
  }

  ///
  /// check email is valid or not
  ///

  void checkEmail(String? val) {
    if (val == null || val == '') {
      emailError = "Please enter mail";
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(val)) {
      emailError = "Please enter valid email";
    } else {
      emailError = "";
    }
    update();
  }

  void checkPassword(String? val) {
    if (val == null || val == '') {
      passwordError = "Please enter password";
    } else if (val.length < 6) {
      passwordError = "Please enter password more then 6 character";
    } else {
      passwordError = "";
    }
    update();
  }
}

class InputConstants {
  static const String userNameEmail = "[0-9A-Za-z!@#\$%&'*+-/=?^_`{|/]";
  static const String password = "[0-9A-Za-z#!@\$%^&*?()|:;.><,?|:;.><,?/]";
}
