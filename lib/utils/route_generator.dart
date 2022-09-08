import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tms_app/screen/home/home_screen.dart';
import 'package:tms_app/screen/login/login_screen.dart';
import 'package:tms_app/screen/splash/splash_screen.dart';
import 'package:tms_app/utils/route_constants.dart';

///
/// RouteGenerator class generate route to navigation and navigation animations
/// [RouteConstants] defined in file in constant folder
///
class RouteGenerater {
  /// this function will return  all routes in list
  List<GetPage> getAllRoute() {
    List<GetPage> pages = [
      GetPage(
          name: RoutesConstants.splashScreen, page: () => const SplashScreen()),
      getPageAnimationR2L(
          name: RoutesConstants.loginScreen, page: const LoginScreen()),
      getPageAnimationR2L(name: RoutesConstants.homeScreen, page: HomeScreen()),
    ];
    return pages;
  }

  /// This function return  with animation [Right To Left]
  GetPage getPageAnimationR2L({required String name, required Widget page}) {
    return GetPage(
      name: name,
      page: () => page,
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    );
  }

  /// if anything goes wrong with route this page will be there
  /// you can find file in the same folder
  GetPage getUndefinedRoute() {
    GetPage page =
        GetPage(name: RoutesConstants.splashScreen, page: () => Container());
    return page;
  }
}
