import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tms_app/screen/home/home_controller.dart';
import 'package:tms_app/screen/home/home_screens/user/user_controller.dart';

class UserScreen extends StatelessWidget {
  UserScreen({Key? key}) : super(key: key);

  UserController userController = Get.put(UserController());
  HomeController homeCnt = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => userController.isLoading.value
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  child: Row(
                    children: [
                      Text("Tootle User :- ${userController.totalUser}"),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          homeCnt.isTab.value = "AddUser";
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 40),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: const [
                              Icon(Icons.add, color: Colors.white),
                              SizedBox(
                                width: 10,
                              ),
                              Text("Add New",
                                  style: TextStyle(color: Colors.white)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 20),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: const [
                //       Text("Name", textAlign: TextAlign.start),
                //       Text("Email", textAlign: TextAlign.start),
                //       Text("PhoneNumber", textAlign: TextAlign.start)
                //     ],
                //   ),
                // ),
                Expanded(
                  child: ListView.builder(
                    itemCount: userController.totalUser,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  index == 0
                                      ? const Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 25),
                                          child: Text("Name"),
                                        )
                                      : const SizedBox(),
                                  Text(userController.nameList[index],
                                      textAlign: TextAlign.start),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  index == 0
                                      ? const Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 25),
                                          child: Text("Email"),
                                        )
                                      : const SizedBox(),
                                  Text(userController.emailList[index],
                                      textAlign: TextAlign.start),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  index == 0
                                      ? const Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 25),
                                          child: Text("Phone"),
                                        )
                                      : const SizedBox(),
                                  Text(userController.phoneList[index],
                                      textAlign: TextAlign.start),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
    );
  }
}
