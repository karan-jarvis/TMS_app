import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tms_app/screen/home/home_controller.dart';
import 'package:tms_app/screen/login/login_screen.dart';
import 'package:tms_app/utils/color_utils.dart';
import 'package:tms_app/utils/prefrences/prefrences.dart';
import 'package:tms_app/utils/route_constants.dart';
import 'package:tms_app/widget/common_button.dart';

///
/// represent  drawer when app is on tablet mode
///

class SideDrawerWidget extends StatelessWidget {
  SideDrawerWidget({Key? key, required this.homeCnt}) : super(key: key);

  HomeController homeCnt;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300,
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ImageTitleWidget(
                      onTap: () {
                        homeCnt.isTab.value = "DashBoardScreen";
                        Get.back();
                      },
                      isShowArrow: homeCnt.isTab.value == "DashBoardScreen"
                          ? true
                          : false,
                      titleLabel: "DashBoard",
                      containerWidth: 350.w,
                    ),
                    ImageTitleWidget(
                      onTap: () {
                        homeCnt.isTab.value = "UserScreen";
                        Get.back();
                      },
                      isShowArrow:
                          homeCnt.isTab.value == "UserScreen" || homeCnt.isTab.value == "AddUser" || homeCnt.isTab.value == "AddUserTwo"|| homeCnt.isTab.value == "BankDetail"  ? true : false,
                      titleLabel: "User",
                      containerWidth: 350.w,
                    ),
                    ImageTitleWidget(
                      onTap: () {
                        homeCnt.isTab.value = "LeaveScreen";
                        Get.back();
                      },
                      isShowArrow:
                          homeCnt.isTab.value == "LeaveScreen" ? true : false,
                      titleLabel: "Leave",
                      containerWidth: 350.w,
                    ),
                    ImageTitleWidget(
                      onTap: () {
                        homeCnt.isTab.value = "ReportScreen";
                        Get.back();
                      },
                      isShowArrow:
                          homeCnt.isTab.value == "ReportScreen" ? true : false,
                      titleLabel: "Report",
                      containerWidth: 350.w,
                    ),
                    ImageTitleWidget(
                      onTap: () {
                        homeCnt.isTab.value = "HolidayScreen";
                        Get.back();
                      },
                      isShowArrow:
                          homeCnt.isTab.value == "HolidayScreen" ? true : false,
                      titleLabel: "Holidays",
                      containerWidth: 350.w,
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () async {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    title: Text('Do you want to logout?'),
                    content: Text('We hate to see you leave...'),
                    actions: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            Expanded(
                                child: CommonButton(
                                    title: "No",
                                    onPressed: () {
                                      Get.back();
                                    })),
                            Expanded(
                              child: CommonButton(
                                  title: "Yes",
                                  onPressed: () async {
                                    await AppPreference()
                                        .clearSharedPreferences();
                                    FirebaseAuth.instance.signOut();
                                    Get.offAllNamed(
                                        RoutesConstants.loginScreen);
                                  }),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  children: const [
                    Text(
                      "Logout",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: Colors.red),
                    ),
                    Spacer(),
                    Icon(
                      Icons.exit_to_app,
                      color: Colors.red,
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}

class ImageTitleWidget extends StatelessWidget {
  ImageTitleWidget(
      {Key? key,
      required this.titleLabel,
      this.onTap,
      this.containerWidth,
      required this.isShowArrow})
      : super(key: key);

  final String titleLabel;
  final Function()? onTap;
  final double? containerWidth;
  int tab = 1;
  bool isShowArrow = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                titleLabel,
                style: TextStyle(
                    fontWeight: isShowArrow ? FontWeight.w600 : FontWeight.w400,
                    color:
                        isShowArrow ? AppColors.color6C0BA9 : AppColors.black,
                    fontSize: 18),
              ),
              const Spacer(),
              isShowArrow
                  ? const Icon(
                      Icons.arrow_right_outlined,
                      color: AppColors.color6C0BA9,
                    )
                  : SizedBox()
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
              width: containerWidth ?? 200.w,
              child: const Divider(
                thickness: 1,
                height: 1,
              )),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
