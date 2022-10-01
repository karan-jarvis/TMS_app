import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  Rx<TextEditingController> searchController = TextEditingController().obs;
  int totalUser = 0;
  int totalLeave = 0;
  RxBool isLoading = false.obs;

  RxString filterMemberRole = "Team Member".obs;

  RxList<UserDetailModel> userList = <UserDetailModel>[].obs;

  RxList<LeaveDetailModel> leaveList = <LeaveDetailModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getUserData();
    getLeaveData();
    update();
  }

  TextEditingController editingController = TextEditingController();

  RxList<UserDetailModel> items = <UserDetailModel>[].obs;

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
      items.clear();
      data.docs.forEach((element) {
        userList.add(
          UserDetailModel(
              id: element.id,
              name: element["full_name"],
              email: element["email"],
              phone: element["phone_number"],
              reference: element["reference_name"],
              password: element["password"],
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
    leaveList.clear();
    await FirebaseFirestore.instance
        .collection('leaves')
        .get()
        .then((QuerySnapshot data) {
      totalLeave = data.docs.length;
      data.docs.forEach((element) {
        leaveList.add(LeaveDetailModel(
          id: element.id,
          name: element["full_name"],
          email: element["email"],
          leaveType: element["leave_type"],
          description: element["description"],
          isApproved: element["is_approved"],
        ));
      });
      update();
      isLoading.value = false;
    });
  }

  void approveLeave({required int index, required String isApproved}) {
    var collection = FirebaseFirestore.instance.collection('leaves');
    collection
        .doc(leaveList[index].id)
        .update({'is_approved': isApproved}) // <-- Updated data
        .then((_) {
      print('Success');
      getLeaveData();
    }).catchError((error) => print('Failed: $error'));
  }

  Future<void> deleteData(index) async {
    try {
      print(items[index].email);
      await FirebaseFirestore.instance
          .collection("users")
          .doc(items[index].id)
          .delete();
      AuthService().deleteUser(items[index].email!, items[index].password);
      items.removeAt(index);

      Get.back();
    } catch (e) {
      log(e.toString(), name: "Deleting Error");
    }
    await getUserData();
  }
}

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future deleteUser(String email, String password) async {
    try {
      User? user = _auth.currentUser;
      AuthCredential credentials =
          EmailAuthProvider.credential(email: email, password: password);
      print(user);
      UserCredential result =
          await user!.reauthenticateWithCredential(credentials);
      await result.user!.delete();
      return true;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}

class UserDetailModel {
  String? name;
  String? email;
  String? phone;
  String? reference;
  String? memberRole;
  String password;
  String id;

  UserDetailModel(
      {this.name,
      this.email,
      this.phone,
      this.reference,
      this.memberRole,
      required this.id,
      required this.password});
}

class LeaveDetailModel {
  String? name;
  String? email;
  String? description;
  String? leaveType;
  String id;
  String? isApproved;

  LeaveDetailModel(
      {this.name,
      this.email,
      this.description,
      this.leaveType,
      this.isApproved,
      required this.id});
}
