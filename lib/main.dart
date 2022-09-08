import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tms_app/utils/route_constants.dart';
import 'package:tms_app/utils/route_generator.dart';

import 'firebase_options.dart';
import 'utils/prefrences/prefrences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppPreference().initialAppPreference();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return ScreenUtilInit(
        designSize: Size(kIsWeb ? 900 : 350, kIsWeb ? 700 : 780),
        builder: (context, widget) => GetMaterialApp(
          builder: (BuildContext context, Widget? child) {
            return MediaQuery(
              /// this MediaQuery will override text size changes from users device setting
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: child ?? const SizedBox(),
            );
          },
          debugShowCheckedModeBanner: false,
          // theme: ThemeData().copyWith(
          //   textTheme: GoogleFonts.poppinsTextTheme(
          //     Theme.of(context).textTheme,
          //   ),
          // ),
          getPages: RouteGenerater().getAllRoute(),
          initialRoute: RoutesConstants.splashScreen,
          unknownRoute: RouteGenerater().getUndefinedRoute(),
          title: 'TMS App',
        ),
      );
    });
  }
}
