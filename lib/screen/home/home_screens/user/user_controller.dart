import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  Rx<TextEditingController> searchController = TextEditingController().obs;
  int totalUser = 0;
  int totalLeave = 0;
  RxBool isLoading = false.obs;

  RxString filterMemberRole = "Team Member".obs;

  RxList<UserDetailModel> userList = <UserDetailModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getUserData();
    getLeaveData();
    update();
  }

  TextEditingController editingController = TextEditingController();

  RxList items = <UserDetailModel>[].obs;

  void filterSearchResults(String query) {
    List<UserDetailModel> dummySearchList = <UserDetailModel>[];
    dummySearchList.addAll(userList);
    if (query.isNotEmpty) {
      List<UserDetailModel> dummyListData = <UserDetailModel>[];
      dummySearchList.forEach((item) {
        if (item.memberRole!.contains(query)) {
          dummyListData.add(item);
        } else if (item.email!.contains(query)) {
          dummyListData.add(item);
        } else if (item.name!.contains(query)) {
          dummyListData.add(item);
        } else if (item.reference!.contains(query)) {
          dummyListData.add(item);
        } else if (item.phone!.contains(query)) {
          dummyListData.add(item);
        }
      });
      items.clear();
      items.addAll(dummyListData);
      return;
    } else {
      items.clear();
      items.addAll(userList);
    }
  }

  Future<void> getUserData() async {
    isLoading.value = true;
    await FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((QuerySnapshot data) {
      totalUser = data.docs.length;
      userList.clear();
      data.docs.forEach((element) {
        userList.add(
          UserDetailModel(
              name: element["full_name"],
              email: element["email"],
              phone: element["phone_number"],
              reference: element["reference_name"],
              memberRole: element["role"]),
        );
      });
      update();
    });
    items.addAll(userList);
    isLoading.value = false;
  }

  Future<void> getLeaveData() async {
    isLoading.value = true;
    await FirebaseFirestore.instance
        .collection('leaves')
        .get()
        .then((QuerySnapshot data) {
      totalLeave = data.docs.length;
      update();
    });
  }
}

class UserDetailModel {
  String? name;
  String? email;
  String? phone;
  String? reference;
  String? memberRole;

  UserDetailModel(
      {this.name, this.email, this.phone, this.reference, this.memberRole});
}
