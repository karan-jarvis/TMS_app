import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tms_app/screen/login/login_cnt.dart';
import 'package:tms_app/screen/reset_password/reset_password_screen.dart';
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
    loginCnt.emailController.value.text = "demo@123.com";
    loginCnt.passwordController.value.text = "123456";
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: false,
        automaticallyImplyLeading: false,
      ),
      body: Obx(
        () => loginCnt.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyTextBox(
                        textFieldKey: const Key("signin_email"),
                        controller: loginCnt.emailController.value,
                        isEnable: true,
                        helperText: "Email",
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
                        onChanged: (String? val) => loginCnt.checkEmail(val!),
                        onEditingComplete: (String? val) =>
                            loginCnt.checkEmail(val!),
                      ),
                      SizedBox(height: 30),
                      MyTextBox(
                        textFieldKey: const Key("signin_password"),
                        controller: loginCnt.passwordController.value,
                        helperText: "Password".tr,
                        onChanged: (String? val) => loginCnt.checkPassword(val),
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
                        height: 30,
                      ),
                      CommonButton(
                          title: "Login",
                          onPressed: () => loginCnt.onPressLogin(context)),
                      const SizedBox(height: 20),
                      InkWell(
                        onTap: () {
                          Get.to(const ResetPasswordScreen());
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 30),
                          child: Text(
                            "Reset password",
                            style: TextStyle(color: Colors.blue),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
