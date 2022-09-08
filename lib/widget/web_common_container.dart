import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tms_app/screen/home/home_controller.dart';
import 'package:tms_app/utils/color_utils.dart';
import 'package:tms_app/widget/responsive.dart';
import 'package:tms_app/widget/side_drawer_widget.dart';

class WebCommonContainer extends StatelessWidget {
  WebCommonContainer(
      {Key? key, required this.bodyWidget, required this.homeCnt})
      : super(key: key);

  HomeController homeCnt;
  Widget bodyWidget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TMS"),
        centerTitle: true,
        automaticallyImplyLeading: Responsive.isTablet(context) ? true : false,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 30),
            child: Center(child: Text("Hello, Demo")),
          )
        ],
      ),
      drawerEnableOpenDragGesture: false,
      drawer: Responsive.isTablet(context)
          ? SideDrawerWidget(
              homeCnt: homeCnt,
            )
          : const SizedBox(),
      body: Row(
        children: [
          if (Responsive.isTablet(context))
            const SizedBox()
          else
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SideDrawerWidget(
                      homeCnt: homeCnt,
                    ),
                  ),
                ],
              ),
            ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  bottomLeft: Radius.circular(40),
                ),
              ),
              child: bodyWidget,
            ),
          ),
        ],
      ),
    );
  }
}
