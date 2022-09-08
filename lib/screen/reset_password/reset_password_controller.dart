import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tms_app/screen/login/login_screen.dart';
import 'package:tms_app/widget/common_button.dart';

class ResetPasswordController extends GetxController {
  Rx<TextEditingController> emailController = TextEditingController().obs;
  FocusNode emailFN = FocusNode();

  String? emailError = "";

  RxBool isLoading = false.obs;

  void onSubmit(context) {
    FocusScope.of(context!).unfocus();
    checkEmail(emailController.value.text);
    print("Onsubmit");
    if (emailError == "") {
      resetPassword(email: emailController.value.text, context: context);
    }
  }

  Future resetPassword({required String email, required context}) async {
    isLoading.value = true;
    await auth.sendPasswordResetEmail(email: email).then((value) {
      showSnackBar(
          context: context,
          title: "Password reset link has been sent to register mail");
      Get.offAll(const LoginScreen());
    }).catchError((e) {
      if (kDebugMode) {
        print("error is :- $e");
      }
      showSnackBar(context: context, title: e.toString());
      isLoading.value = false;
    });
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
}
