import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetMemberDetailController extends GetxController {
  Rx<TextEditingController> detailController = TextEditingController().obs;
  String detailError = "";
  FocusNode detailFN = FocusNode();

  void chekDetail(String? val) {
    if (val == null || val == '') {
      detailError = "Please enter detail";
    } else {
      detailError = "";
    }
  }

  void onFind(context) {
    FocusScope.of(context!).unfocus();
    chekDetail(detailController.value.text);
  }
}
