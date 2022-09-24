import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tms_app/screen/home/home_controller.dart';
import 'package:tms_app/screen/home/home_screens/dash_board/dash_board_helper_widget.dart';
import 'package:tms_app/screen/home/home_screens/user/user_controller.dart';

class DashBoardScreen extends StatelessWidget {
  DashBoardScreen({Key? key}) : super(key: key);

  UserController userController = Get.put(UserController());
  HomeController homeCnt = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => userController.isLoading.value
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  child: Row(
                    children: [
                      SquareDetailBox(
                          title: "Tootle Users",
                          value: userController.totalUser.toString()),
                      const SizedBox(
                        width: 40,
                      ),
                      SquareDetailBox(
                          title: "Leave Req.",
                          value: userController.totalLeave.toString())
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
