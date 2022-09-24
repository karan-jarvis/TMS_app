import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:textfield_search/textfield_search.dart';
import 'package:tms_app/screen/home/home_controller.dart';
import 'package:tms_app/screen/home/home_screens/user/user_controller.dart';
import 'package:tms_app/utils/color_utils.dart';
import 'package:tms_app/widget/common_button.dart';
import 'package:tms_app/widget/common_text_field.dart';

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Tootle Users:  ${userController.totalUser}",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: AppColors.color6C0BA9)),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          homeCnt.isTab.value = "AddUser";
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 40),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: AppColors.color6C0BA9,
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
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Text("Search user",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: AppColors.color6C0BA9)),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          onChanged: (value) {
                            userController.filterSearchResults(value);
                          },
                          controller: userController.editingController,
                          decoration: InputDecoration(
                            hintText: "Search",
                            // errorText: error != "" ? error! : "",
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: AppColors.color909CA2,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: AppColors.color909CA2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: AppColors.color909CA2,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            contentPadding: const EdgeInsets.all(10),
                            counterText: "",
                            hintStyle: TextStyle(
                                    color: AppColors.black.withOpacity(0.5))
                                .copyWith(),
                            fillColor: Colors.transparent,
                            filled: true,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Obx(
                        () => DropdownButton<String>(
                          disabledHint: Text("Disable Hint"),
                          value: userController.filterMemberRole.value,
                          isDense: true,
                          hint: Text("Select The Role"),
                          onChanged: (String? newValue) {
                            userController.filterMemberRole.value = newValue!;
                            userController.filterSearchResults(newValue);
                          },
                          items: ['Team Member', "Team Leader"]
                              .map((String value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: userController.items.length,
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
                                          child: Text(
                                            "Employee Name",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color: AppColors.color6C0BA9,
                                                fontSize: 18),
                                          ),
                                        )
                                      : const SizedBox(),
                                  Text(" - ${userController.items[index].name}",
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
                                          child: Text(
                                            "Email address",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color: AppColors.color6C0BA9,
                                                fontSize: 18),
                                          ),
                                        )
                                      : const SizedBox(),
                                  Text(
                                      " - ${userController.items[index].email}",
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
                                          child: Text(
                                            "Reference",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color: AppColors.color6C0BA9,
                                                fontSize: 18),
                                          ),
                                        )
                                      : const SizedBox(),
                                  Text(
                                      " - ${userController.items[index].reference}",
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
                                          child: Text("Phone number",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  color: AppColors.color6C0BA9,
                                                  fontSize: 18)),
                                        )
                                      : const SizedBox(),
                                  Text(
                                      " - ${userController.items[index].phone}",
                                      textAlign: TextAlign.start),
                                ],
                              ),
                            ),
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
