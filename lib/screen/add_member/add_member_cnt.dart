import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tms_app/screen/home/home_controller.dart';
import 'package:tms_app/screen/home/home_screens/user/user_controller.dart';
import 'package:tms_app/widget/common_button.dart';

class AddMemberController extends GetxController {
  RxBool isLoading = false.obs;

  RxString memberRole = "Team Member".obs;

  final user = FirebaseAuth.instance;
  HomeController homeCnt = Get.find<HomeController>();
  UserController userCnt = Get.find<UserController>();

  Rx<TextEditingController> nameController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> phoneController = TextEditingController().obs;
  Rx<TextEditingController> residentAddressController =
      TextEditingController().obs;

  Rx<TextEditingController> accountNumberController =
      TextEditingController().obs;
  Rx<TextEditingController> ifscCodeController = TextEditingController().obs;
  Rx<TextEditingController> holderNameController = TextEditingController().obs;
  Rx<TextEditingController> bankNameController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  Rx<TextEditingController> refController = TextEditingController().obs;

  String nameError = "";
  String emailError = "";
  String phoneError = "";
  String residentAddressError = "";
  String? passwordError = "";
  String? refError = "";

  String accountNumberError = "";
  String ifscCodeError = "";
  String holderNameError = "";
  String bankNameError = "";

  String profilePic = "";
  String aadhaarCardPic = "";
  String panCardPic = "";

  FocusNode nameFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode phoneFocusNode = FocusNode();
  FocusNode passwordFN = FocusNode();
  FocusNode refFN = FocusNode();

  FocusNode residentAddressFocusNode = FocusNode();

  FocusNode accountNumberFocusNode = FocusNode();
  FocusNode ifscCodeFocusNode = FocusNode();
  FocusNode holderNameFocusNode = FocusNode();
  FocusNode bankNameFocusNode = FocusNode();

  void onSubmit(context) {
    FocusScope.of(context).unfocus();
    checkName(nameController.value.text);
    checkEmail(emailController.value.text);
    checkPhone(phoneController.value.text);
    //checkBankDetail(bankDetailController.value.text);
    checkAddress(residentAddressController.value.text);
    checkPassword(passwordController.value.text);
    // if (nameError == "" &&
    //     emailError == "" &&
    //     phoneError == "" &&
    //     residentAddressError == "" &&
    //     passwordError == "") {
      homeCnt.isTab.value = "AddUserTwo";
    //}
  }

  Future<void> onCreate(context) async {
    FocusScope.of(context).unfocus();
    checkAccountNumber(accountNumberController.value.text);
    checkISFCCode(ifscCodeController.value.text);
    checkBankName(bankNameController.value.text);
    checkHolderName(holderNameController.value.text);
    if (accountNumberError == "" &&
        ifscCodeError == "" &&
        bankNameError == "" &&
        holderNameError == "") {
      user
          .createUserWithEmailAndPassword(
              email: emailController.value.text,
              password: passwordController.value.text)
          .then((value) async {
        await addUser(context);
      }).catchError((e) {
        showSnackBar(context: context, title: e.toString());
      });
    }
  }

  CollectionReference<Map<String, dynamic>> users =
      FirebaseFirestore.instance.collection('users');

  Future<void> addUser(context) {
    // Call the user's CollectionReference to add a new user
    return users.add({
      'full_name': nameController.value.text,
      'email': emailController.value.text,
      'phone_number': phoneController.value.text,
      'address': residentAddressController.value.text,
      'profile_pic': profilePic,
      'pan_card': panCardPic,
      'aadhaar_card': aadhaarCardPic,
      'ac_number': accountNumberController.value.text,
      'IFSC_code': ifscCodeController.value.text,
      'account_holder_name': holderNameController.value.text,
      'bank_name': bankNameController.value.text,
      'reference_name': refController.value.text,
      'role': memberRole.value
    }).then((value) {
      userCnt.getUserData();
      homeCnt.isTab.value = "UserScreen";
      showSnackBar(context: context, title: "User Created");
    }).catchError((error) => print("Failed to add user: $error"));
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

  void checkName(String? val) {
    if (val == null || val == '') {
      nameError = "Please enter name";
    } else {
      nameError = "";
    }
  }

  void checkRef(String? val) {
    if (val == null || val == '') {
      refError = "Please enter reference name";
    } else {
      refError = "";
    }
  }

  void checkPhone(String? val) {
    if (val == null || val == '') {
      phoneError = "Please enter phone number";
    } else if (val.length < 10) {
      phoneError = "Please enter your valid phone number";
    } else {
      phoneError = "";
    }
  }

  void checkAddress(String? val) {
    if (val == null || val == '') {
      residentAddressError = "Please enter address";
    } else {
      residentAddressError = "";
    }
  }

  void checkAccountNumber(String? val) {
    if (val == null || val == '') {
      accountNumberError = "Please enter account number";
    } else {
      accountNumberError = "";
    }
  }

  void checkISFCCode(String? val) {
    if (val == null || val == '') {
      ifscCodeError = "Please enter IFSC code";
    } else {
      ifscCodeError = "";
    }
  }

  void checkHolderName(String? val) {
    if (val == null || val == '') {
      holderNameError = "Please enter account holder name";
    } else {
      holderNameError = "";
    }
  }

  void checkBankName(String? val) {
    if (val == null || val == '') {
      bankNameError = "Please enter bank name";
    } else {
      bankNameError = "";
    }
  }

  final storageRef = FirebaseStorage.instance.ref();

  Uint8List profilePicture = Uint8List(10);

  Future<void> selectProfilePic(context) async {
    final ImagePicker _picker = ImagePicker();
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      var selectedImage = await image.readAsBytes();
      profilePicture = selectedImage;
      isLoading.value = true;
      final mountainsRef = storageRef.child("ProfilePic/${image.name}");
      try {
        // Upload raw data.
        await mountainsRef.putData(profilePicture);
        profilePic = await mountainsRef.getDownloadURL();
        print("addMemberCnt.profilePicL :- ${profilePic}");
        update();
        isLoading.value = false;
      } catch (e) {
        // ...
        isLoading.value = false;
        showSnackBar(context: context, title: e.toString());
        print(e.toString());
      }
    } else {
      print("Image not selcted");
    }
  }
}
