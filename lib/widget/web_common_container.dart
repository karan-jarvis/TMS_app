import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tms_app/screen/home/home_controller.dart';
import 'package:tms_app/utils/color_utils.dart';
import 'package:tms_app/widget/responsive.dart';
import 'package:tms_app/widget/side_drawer_widget.dart';

final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key

class WebCommonContainer extends StatelessWidget {
  WebCommonContainer(
      {Key? key, required this.bodyWidget, required this.homeCnt})
      : super(key: key);

  HomeController homeCnt;
  Widget bodyWidget;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        key: _key,
        // appBar: AppBar(
        //   backgroundColor: AppColors.color6C0BA9,
        //   title: Text(homeCnt.appBarTitle.value),
        //   centerTitle: false,
        //   leading: InkWell(
        //       onTap: () {
        //         if (Responsive.isTablet(context)) {
        //           _key.currentState!.openDrawer();
        //         }
        //         if (homeCnt.isShowDrawer.value == true) {
        //           homeCnt.isShowDrawer.value = false;
        //         } else {
        //           homeCnt.isShowDrawer.value = true;
        //         }
        //       },
        //       child: Icon(Icons.menu_outlined)),
        //   automaticallyImplyLeading:
        //       Responsive.isTablet(context) ? true : false,
        //   actions: [
        //     Padding(
        //       padding: EdgeInsets.only(right: 30),
        //       child: Center(child: Text("Hello, ${homeCnt.userName.value}")),
        //     )
        //   ],
        // ),
        // drawerEnableOpenDragGesture: false,
        drawer: Drawer(
          elevation: 50,
          child: SideDrawerWidget(
            homeCnt: homeCnt,
          ),
        ),
        body: Row(
          children: [
            if (Responsive.isTablet(context))
              const SizedBox()
            else
              homeCnt.isShowDrawer.value
                  ? Padding(
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
                    )
                  : SizedBox(),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    bottomLeft: Radius.circular(40),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AppBar(
                      backgroundColor: AppColors.color6C0BA9,
                      title: Text(homeCnt.appBarTitle.value),
                      centerTitle: false,
                      leading: InkWell(
                          onTap: () {
                            if (Responsive.isTablet(context)) {
                              _key.currentState!.openDrawer();
                            }
                            if (homeCnt.isShowDrawer.value == true) {
                              homeCnt.isShowDrawer.value = false;
                            } else {
                              homeCnt.isShowDrawer.value = true;
                            }
                          },
                          child: Icon(Icons.menu_outlined)),
                      automaticallyImplyLeading:
                      Responsive.isTablet(context) ? true : false,
                      // actions: [
                      //   Padding(
                      //     padding: EdgeInsets.only(right: 30),
                      //     child: Center(child: Text("Hello, ${homeCnt.userName.value}")),
                      //   )
                      // ],
                    ),
                    Expanded(child: bodyWidget),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
