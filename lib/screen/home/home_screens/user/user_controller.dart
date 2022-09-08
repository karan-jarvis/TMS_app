import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  Rx<TextEditingController> searchController = TextEditingController().obs;
  int totalUser = 0;
  RxBool isLoading = false.obs;

  List<String> nameList = [];
  List<String> emailList = [];
  List<String> phoneList = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getUserData();
  }

  Future<void> getUserData() async {
    isLoading.value = true;
    await FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((QuerySnapshot data) {
      totalUser = data.docs.length ;
      nameList.clear();
      emailList.clear();
      phoneList.clear();
      data.docs.forEach((element) {
        nameList.add(element["full_name"]);
        emailList.add(element["email"]);
        phoneList.add(element["phone_number"]);
        print(nameList);
      });
      update();
    });
    isLoading.value = false;
  }
}
