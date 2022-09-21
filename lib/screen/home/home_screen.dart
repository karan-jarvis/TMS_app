import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tms_app/screen/add_member/add_member_screen.dart';
import 'package:tms_app/screen/add_member/add_member_screen_2.dart';
import 'package:tms_app/screen/add_member/add_member_screen_3_bank_detail.dart';
import 'package:tms_app/screen/home/home_controller.dart';
import 'package:tms_app/screen/home/home_screens/dash_board/dash_board_screen.dart';
import 'package:tms_app/screen/home/home_screens/holidays/Holidays.dart';
import 'package:tms_app/screen/home/home_screens/leave/leave_screen.dart';
import 'package:tms_app/screen/home/home_screens/report/report_screen.dart';
import 'package:tms_app/screen/home/home_screens/user/user_screen.dart';
import 'package:tms_app/widget/web_common_container.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  HomeController homeCnt = Get.put(HomeController());

  funcReturnScreen() {
    switch (homeCnt.isTab.value) {
      case "DashBoardScreen":
        {
          return DashBoardScreen();
        }
      case "UserScreen":
        {
          return UserScreen();
        }
      case "LeaveScreen":
        {
          return LeaveScreen();
        }
      case "ReportScreen":
        {
          return const ReportScreen();
        }
      case "HolidayScreen":
        {
          return HolidaysScreen();
        }
      case "AddUser":
        {
          return AddMemberScreen();
        }
      case "AddUserTwo":
        {
          return const AddMemberScreen2();
        }
      case "BankDetail":
        {
          return const AddBankDetailScreen();
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => WebCommonContainer(
        homeCnt: homeCnt,
        bodyWidget: funcReturnScreen(),
      ),
    );
  }
}
