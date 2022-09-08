import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tms_app/screen/login/login_cnt.dart';
import 'package:tms_app/screen/login/login_screen.dart';
import 'package:tms_app/screen/reset_password/reset_password_controller.dart';
import 'package:tms_app/widget/common_button.dart';
import 'package:tms_app/widget/common_text_field.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  ResetPasswordController resetPwdCnt = Get.put(ResetPasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Reset Password"),centerTitle: false),
      body: Obx(
        () => resetPwdCnt.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Obx(
                    () => MyTextBox(
                      textFieldKey: const Key("signin_email"),
                      controller: resetPwdCnt.emailController.value,
                      isEnable: true,
                      helperText: "Email",
                      focusNode: resetPwdCnt.emailFN,
                      hintText: "Enter your email",
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      inputFormatters: [
                        FilteringTextInputFormatter(
                          RegExp(InputConstants.userNameEmail),
                          allow: true,
                        ),
                      ],
                      error: resetPwdCnt.emailError,
                      onChanged: (String? val) => resetPwdCnt.checkEmail(val!),
                      onEditingComplete: (String? val) =>
                          resetPwdCnt.checkEmail(val!),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CommonButton(
                    onPressed: () => resetPwdCnt.onSubmit(context),
                    title: 'Submit',
                  ),
                ],
              ),
      ),
    );
  }
}
