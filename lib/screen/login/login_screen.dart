import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tms_app/screen/login/login_cnt.dart';
import 'package:tms_app/screen/reset_password/reset_password_screen.dart';
import 'package:tms_app/utils/color_utils.dart';
import 'package:tms_app/widget/common_button.dart';
import 'package:tms_app/widget/common_text_field.dart';

final FirebaseAuth auth = FirebaseAuth.instance;

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginController loginCnt = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    loginCnt.emailController.value.text = "admin2522@yopmail.com";
    loginCnt.passwordController.value.text = "123456789";
    return Scaffold(
      body: Obx(
        () => loginCnt.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Center(
                child: SingleChildScrollView(
                  child: Material(
                    elevation: 10,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      width: 400,
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      padding: const EdgeInsets.symmetric(vertical: 100),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text("Sign in",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25,
                                            color: AppColors.color6C0BA9)),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text("Welcome to team management system")
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          MyTextBox(
                            textFieldKey: const Key("signin_email"),
                            controller: loginCnt.emailController.value,
                            isEnable: true,
                            helperText: "Email address *",
                            focusNode: loginCnt.emailFN,
                            nextFocus: loginCnt.passwordFN,
                            hintText: "Enter your email",
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            inputFormatters: [
                              FilteringTextInputFormatter(
                                RegExp(InputConstants.userNameEmail),
                                allow: true,
                              ),
                            ],
                            error: loginCnt.emailError,
                            onChanged: (String? val) =>
                                loginCnt.checkEmail(val!),
                            onEditingComplete: (String? val) =>
                                loginCnt.checkEmail(val!),
                          ),
                          const SizedBox(height: 30),
                          MyTextBox(
                            textFieldKey: const Key("signin_password"),
                            controller: loginCnt.passwordController.value,
                            helperText: "Password *".tr,
                            onChanged: (String? val) =>
                                loginCnt.checkPassword(val),
                            isEnable: true,
                            focusNode: loginCnt.passwordFN,
                            inputFormatters: [
                              FilteringTextInputFormatter(
                                RegExp(InputConstants.password),
                                allow: true,
                              ),
                            ],
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.done,
                            hintText: "Enter your password",
                            error: loginCnt.passwordError,
                            onEditingComplete: (String? val) =>
                                loginCnt.checkPassword(val),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.to(const ResetPasswordScreen());
                                },
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 30),
                                  child: Text(
                                    "Forgot password?",
                                    style:
                                        TextStyle(color: AppColors.color6C0BA9),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          CommonButton(
                              title: "Login",
                              onPressed: () => loginCnt.onPressLogin(context)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
