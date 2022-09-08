import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tms_app/screen/login/login_screen.dart';
import 'package:tms_app/utils/color_utils.dart';
import 'package:tms_app/utils/prefrences/prefrences.dart';
import 'package:tms_app/utils/prefrences/prefrences_key.dart';
import 'package:tms_app/utils/route_constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    navigateToSecondScreen();
  }

  void navigateToSecondScreen() {
    Future.delayed(const Duration(seconds: 2), () {
      bool isLogin = AppPreference().getBool(PreferencesKey.isLogin);
      if (isLogin) {
        Get.offAllNamed(RoutesConstants.homeScreen);
      } else {
        Get.offAllNamed(RoutesConstants.loginScreen);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Icon(
              CupertinoIcons.group,
              size: 50,
              color: AppColors.black,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Team Management System",
              style: TextStyle(fontSize: 20, color: AppColors.black),
            )
          ],
        ),
      ),
    );
  }
}
