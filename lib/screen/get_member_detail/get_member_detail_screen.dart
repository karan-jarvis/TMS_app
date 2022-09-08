import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tms_app/screen/get_member_detail/get_member_detail_controller.dart';
import 'package:tms_app/widget/common_button.dart';
import 'package:tms_app/widget/common_text_field.dart';

class GetMemberDetailScreen extends StatefulWidget {
  const GetMemberDetailScreen({Key? key}) : super(key: key);

  @override
  State<GetMemberDetailScreen> createState() => _GetMemberDetailScreenState();
}

class _GetMemberDetailScreenState extends State<GetMemberDetailScreen> {
  GetMemberDetailController getMemberDetailCnt =
      Get.put(GetMemberDetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Find User"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyTextBox(
              controller: getMemberDetailCnt.detailController.value,
              hintText: "Enter User Detail",
              helperText: "User Detail",
              error: getMemberDetailCnt.detailError,
              focusNode: getMemberDetailCnt.detailFN,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              onChanged: (String? val) => getMemberDetailCnt.chekDetail(val!),
              onEditingComplete: (String? val) =>
                  getMemberDetailCnt.chekDetail(val!),
            ),
            SizedBox(
              height: 30,
            ),
            CommonButton(
              title: "Find",
              onPressed: () => getMemberDetailCnt.onFind(context),
            )
          ],
        ),
      ),
    );
  }
}
