import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tms_app/screen/home/home_screens/leave/leave_controller.dart';
import 'package:tms_app/screen/home/home_screens/user/user_controller.dart';
import 'package:tms_app/utils/color_utils.dart';

class LeaveScreen extends StatelessWidget {
  LeaveScreen({Key? key}) : super(key: key);

  LeaveController leaveController = Get.put(LeaveController());
  UserController userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => userController.isLoading.value
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  child: Row(
                    children: [
                      Text(
                        "Tootle Leave Request:  ${userController.totalLeave}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: AppColors.color6C0BA9),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: userController.leaveList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  index == 0
                                      ? const Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 25),
                                          child: Text(
                                            "Employee Name",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color: AppColors.color6C0BA9,
                                                fontSize: 18),
                                          ),
                                        )
                                      : const SizedBox(),
                                  Text(
                                      " - ${userController.leaveList[index].name}",
                                      textAlign: TextAlign.start),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  index == 0
                                      ? const Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 25),
                                          child: Text(
                                            "Email address",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color: AppColors.color6C0BA9,
                                                fontSize: 18),
                                          ),
                                        )
                                      : const SizedBox(),
                                  Text(
                                      " - ${userController.leaveList[index].email}",
                                      textAlign: TextAlign.start),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  index == 0
                                      ? const Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 25),
                                          child: Text(
                                            "Leave Description",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color: AppColors.color6C0BA9,
                                                fontSize: 18),
                                          ),
                                        )
                                      : const SizedBox(),
                                  Text(
                                      " - ${userController.leaveList[index].description}",
                                      textAlign: TextAlign.start),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    index == 0
                                        ? const Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 25),
                                            child: Text(
                                              "Leave Approval",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  color: AppColors.color6C0BA9,
                                                  fontSize: 18),
                                            ),
                                          )
                                        : const SizedBox(),
                                    userController.leaveList[index].isApproved ==
                                                "true" ||
                                            userController.leaveList[index]
                                                    .isApproved ==
                                                "false"
                                        ? Text(
                                            userController.leaveList[index]
                                                        .isApproved ==
                                                    "true"
                                                ? "Approved"
                                                : "Decline",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 15,
                                                color: AppColors.color6C0BA9),
                                          )
                                        : Row(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.all(2),
                                                decoration: BoxDecoration(
                                                    color: Colors.green,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: IconButton(
                                                  onPressed: () =>
                                                      userController.approveLeave(
                                                          index: index,
                                                          isApproved: "true"),
                                                  icon: const Icon(
                                                      Icons.done_outlined,
                                                      color: Colors.white),
                                                ),
                                              ),
                                              SizedBox(width: 20),
                                              Container(
                                                padding: EdgeInsets.all(2),
                                                decoration: BoxDecoration(
                                                    color: Colors.red,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: IconButton(
                                                  onPressed: () =>
                                                      userController.approveLeave(
                                                          index: index,
                                                          isApproved: "false"),
                                                  icon: const Icon(Icons.close,
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ],
                                          ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
    );
  }
}

// child: Obx(
// () => leaveController.isLoading.value
// ? CircularProgressIndicator()
//     : Padding(
// padding: const EdgeInsets.only(top: 30),
// child: Obx(
// () => Column(
// children: [
// MyTextBox(
// controller: leaveController.leaveCnt.value,
// isEnable: true,
// helperText: "Leave reason",
// focusNode: leaveController.leaveFN,
// nextFocus: leaveController.leaveDetailFN,
// hintText: "Enter Reason",
// keyboardType: TextInputType.text,
// textInputAction: TextInputAction.next,
// error: leaveController.leaveError,
// onChanged: (String? val) =>
// leaveController.checkLeave(val!),
// onEditingComplete: (String? val) =>
// leaveController.checkLeave(val!),
// ),
// const SizedBox(
// height: 30,
// ),
// MyTextBox(
// controller: leaveController.leaveDetailCnt.value,
// isEnable: true,
// helperText: "Leave Detail",
// focusNode: leaveController.leaveDetailFN,
// hintText: "Enter detail about leave",
// keyboardType: TextInputType.text,
// textInputAction: TextInputAction.next,
// error: leaveController.leaveDetailError,
// onChanged: (String? val) =>
// leaveController.checkLeaveDetail(val!),
// onEditingComplete: (String? val) =>
// leaveController.checkLeaveDetail(val!),
// ),
// const SizedBox(
// height: 30,
// ),
// Padding(
// padding: const EdgeInsets.symmetric(horizontal: 30),
// child: Obx(
// () => Row(
// children: [
// Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// const Text("Leave type"),
// const SizedBox(
// height: 10,
// ),
// Obx(
// () => DropdownButton<String>(
// value: leaveController.leaveType.value,
// isDense: true,
// hint: const Text("Select The Role"),
// onChanged: (String? newValue) {
// leaveController.leaveType.value =
// newValue!;
// },
// items: [
// 'Half leave',
// "Full leave",
// "One day leave"
// ].map((String value) {
// return DropdownMenuItem(
// value: value,
// child: Text(value),
// );
// }).toList(),
// ),
// ),
// ],
// ),
// SizedBox(
// width: 100,
// ),
// leaveController.leaveType.value == "Half leave"
// ? Column(
// crossAxisAlignment:
// CrossAxisAlignment.start,
// children: [
// const Text("Leave Duration"),
// const SizedBox(
// height: 10,
// ),
// Obx(
// () => DropdownButton<String>(
// value: leaveController
//     .leaveDuration.value,
// isDense: true,
// hint: const Text("Select The Role"),
// onChanged: (String? newValue) {
// leaveController.leaveDuration
//     .value = newValue!;
// },
// items: [
// '1 hour',
// "2 hour",
// "3 hour",
// "4 hour",
// "5 hour"
// ].map((String value) {
// return DropdownMenuItem(
// value: value,
// child: Text(value),
// );
// }).toList(),
// ),
// ),
// ],
// )
// : SizedBox(),
// ],
// ),
// ),
// ),
// leaveController.leaveType.value == "Full leave"
// ? Padding(
// padding: const EdgeInsets.symmetric(
// vertical: 30, horizontal: 30),
// child: Row(
// children: [
// Column(
// crossAxisAlignment:
// CrossAxisAlignment.start,
// children: [
// Text("Start Date"),
// SizedBox(
// height: 10,
// ),
// InkWell(
// onTap: () async {
// DateTime? pickedDate =
//     await showDatePicker(
// context: context,
// initialDate: DateTime.now(),
// firstDate: DateTime.now(),
// //DateTime.now() - not to allow to choose before today.
// lastDate: DateTime(2100));
//
// if (pickedDate != null) {
// print(
// pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
// String formattedDate =
// DateFormat('yyyy-MM-dd')
//     .format(pickedDate);
// print(
// formattedDate); //formatted date output using intl package =>  2021-03-16
// leaveController.startDate.value =
// formattedDate; //set output date to TextField value.
// } else {}
// },
// child: Container(
// padding: EdgeInsets.symmetric(
// horizontal: 50, vertical: 10),
// decoration: BoxDecoration(
// borderRadius:
// BorderRadius.circular(20),
// border: Border.all()),
// child: Text(
// leaveController.startDate.value),
// ),
// ),
// ],
// ),
// SizedBox(
// width: 100,
// ),
// Column(
// crossAxisAlignment:
// CrossAxisAlignment.start,
// children: [
// Text("End Date"),
// SizedBox(
// height: 10,
// ),
// InkWell(
// onTap: () async {
// DateTime? pickedDate =
//     await showDatePicker(
// context: context,
// initialDate: DateTime.now(),
// firstDate: DateTime.now(),
// //DateTime.now() - not to allow to choose before today.
// lastDate: DateTime(2100));
//
// if (pickedDate != null) {
// print(
// pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
// String formattedDate =
// DateFormat('yyyy-MM-dd')
//     .format(pickedDate);
// print(
// formattedDate); //formatted date output using intl package =>  2021-03-16
// leaveController.endDate.value =
// formattedDate; //set output date to TextField value.
// } else {}
// },
// child: Container(
// padding: EdgeInsets.symmetric(
// horizontal: 50, vertical: 10),
// decoration: BoxDecoration(
// borderRadius:
// BorderRadius.circular(20),
// border: Border.all()),
// child: Text(
// leaveController.endDate.value),
// ),
// ),
// ],
// ),
// ],
// ),
// )
// : Container(),
// SizedBox(
// height: 30,
// ),
// CommonButton(
// title: "Submit",
// onPressed: () => leaveController.onSubmit(context)),
// ],
// ),
// ),
// ),
// ),
