import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tms_app/screen/add_member/add_member_screen.dart';
import 'package:tms_app/screen/get_member_detail/get_member_detail_screen.dart';
import 'package:tms_app/widget/common_button.dart';

class AdminOptionScreen extends StatefulWidget {
  const AdminOptionScreen({Key? key}) : super(key: key);

  @override
  State<AdminOptionScreen> createState() => _AdminOptionScreenState();
}

class _AdminOptionScreenState extends State<AdminOptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CommonButton(
                title: "Add member",
                onPressed: () {
                  Get.to(AddMemberScreen());
                }),
            const SizedBox(
              height: 50,
            ),
            CommonButton(
                title: "Get Member Detail",
                onPressed: () {
                  Get.to(const GetMemberDetailScreen());
                }),
          ],
        ),
      ),
    );
  }
}
