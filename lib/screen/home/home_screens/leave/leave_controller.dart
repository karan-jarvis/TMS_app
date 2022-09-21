import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LeaveController extends GetxController {
  Rx<TextEditingController> leaveCnt = TextEditingController().obs;
  Rx<TextEditingController> leaveDetailCnt = TextEditingController().obs;

  FocusNode leaveFN = FocusNode();
  FocusNode leaveDetailFN = FocusNode();

  String? leaveError = "";
  String? leaveDetailError = "";

  RxString leaveType = "Half leave".obs;
  RxString leaveDuration = "1 hour".obs;

  RxString startDate = "Select the date".obs;
  RxString endDate = "Select the date".obs;

  void checkLeave(String? val) {
    if (val == null || val == '') {
      leaveError = "Please enter Leave Reason";
    } else {
      leaveError = "";
    }
    update();
  }

  void checkLeaveDetail(String? val) {
    if (val == null || val == '') {
      leaveDetailError = "Please enter leave details";
    } else {
      leaveDetailError = "";
    }
    update();
  }
}
