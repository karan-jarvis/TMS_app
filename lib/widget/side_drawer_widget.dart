import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tms_app/screen/home/home_controller.dart';
import 'package:tms_app/utils/color_utils.dart';

///
/// represent  drawer when app is on tablet mode
///

class SideDrawerWidget extends StatelessWidget {
  SideDrawerWidget({Key? key, required this.homeCnt}) : super(key: key);

  HomeController homeCnt;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300,
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ImageTitleWidget(
                      onTap: () {
                        homeCnt.isTab.value = "DashBoardScreen";
                      },
                      titleLabel: "DashBoard",
                      containerWidth: 350.w,
                    ),
                    ImageTitleWidget(
                      onTap: () {
                        homeCnt.isTab.value = "UserScreen";
                      },
                      titleLabel: "User",
                      containerWidth: 350.w,
                    ),
                    ImageTitleWidget(
                      onTap: () {
                        homeCnt.isTab.value = "LeaveScreen";
                      },
                      titleLabel: "Leave",
                      containerWidth: 350.w,
                    ),
                    ImageTitleWidget(
                      onTap: () {
                        homeCnt.isTab.value = "ReportScreen";
                      },
                      titleLabel: "Report",
                      containerWidth: 350.w,
                    ),
                    ImageTitleWidget(
                      onTap: () {
                        homeCnt.isTab.value = "HolidayScreen";
                      },
                      titleLabel: "Holidays",
                      containerWidth: 350.w,
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}

class ImageTitleWidget extends StatelessWidget {
  ImageTitleWidget(
      {Key? key, required this.titleLabel, this.onTap, this.containerWidth})
      : super(key: key);

  final String titleLabel;
  final Function()? onTap;
  final double? containerWidth;
  int tab = 1;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                titleLabel,
                style:
                    const TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
              ),
              const Spacer(),
              const Icon(Icons.arrow_right_outlined)
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
              width: containerWidth ?? 200.w,
              child: const Divider(
                thickness: 1,
                height: 1,
              )),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
