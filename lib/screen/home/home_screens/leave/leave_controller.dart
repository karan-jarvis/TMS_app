import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tms_app/widget/common_button.dart';

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

  RxBool isLoading = false.obs;

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

  Future<void> onSubmit(context) async {
    checkLeaveDetail(leaveDetailCnt.value.text);
    checkLeave(leaveCnt.value.text);

    isLoading.value = true;

    if (leaveError == "" && leaveDetailError == "") {
      if (leaveType.value == "Full leave") {
        if (startDate.value == "Select the date") {
          showSnackBar(context: context, title: "Please select the start date");
        } else if (endDate.value == "Select the date") {
          showSnackBar(context: context, title: "Please select the end date");
        } else {
          await createLeaveApplication(context);
        }
      } else {
        await createLeaveApplication(context);
      }
    }
    isLoading.value = false;
  }

  CollectionReference<Map<String, dynamic>> leave =
      FirebaseFirestore.instance.collection('leaves');

  Future<void> createLeaveApplication(context) async {
    // Call the user's CollectionReference to add a new user
    return leave.add({
      'employee_name': "Demo",
      'leave_description': leaveDetailCnt.value.text,
      'leave_duration': leaveDuration.value,
      'leave_end_at': endDate.value,
      'leave_reason': leaveCnt.value.text,
      'leave_start_from': startDate.value,
      'leave_type': leaveType.value,
    }).then((value) {
      showSnackBar(
          context: context,
          title:
              "Your leave application has been sent to author please wait for confirmation");
    }).catchError((error) => print("Failed to add leave: $error"));
  }
}
