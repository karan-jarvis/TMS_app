import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tms_app/screen/add_member/add_member_cnt.dart';
import 'package:tms_app/screen/home/home_controller.dart';
import 'package:tms_app/widget/common_button.dart';
import 'package:tms_app/widget/common_text_field.dart';

class AddMemberScreen2 extends StatefulWidget {
  const AddMemberScreen2({Key? key}) : super(key: key);

  @override
  State<AddMemberScreen2> createState() => _AddMemberScreen2State();
}

class _AddMemberScreen2State extends State<AddMemberScreen2> {
  Uint8List aadhaarCardPicture = Uint8List(10);
  Uint8List panCardPicture = Uint8List(10);

  HomeController homeCnt = Get.find<HomeController>();
  AddMemberController addMemberCnt = Get.find<AddMemberController>();

  final storageRef = FirebaseStorage.instance.ref();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Obx(
        () => addMemberCnt.isLoading.value
            ? const CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              homeCnt.isTab.value = "AddUser";
                            },
                            icon: const Icon(Icons.arrow_back_ios)),
                      ],
                    ),
                  ),
                  const Spacer(),
                  const SizedBox(
                    height: 30,
                  ),
                  Obx(
                    () => DropdownButton<String>(
                      value: addMemberCnt.memberRole.value,
                      isDense: true,
                      hint: Text("Select The Role"),
                      onChanged: (String? newValue) {
                        addMemberCnt.memberRole.value = newValue!;
                      },
                      items: ['Team Member', "Team Leader"].map((String value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MyTextBox(
                    controller: addMemberCnt.refController.value,
                    hintText: "Please Enter Reference",
                    helperText: "Reference By",
                    error: addMemberCnt.refError,
                    focusNode: addMemberCnt.refFN,
                    nextFocus: addMemberCnt.refFN,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    onChanged: (String? val) => addMemberCnt.checkRef(val!),
                    onEditingComplete: (String? val) =>
                        addMemberCnt.checkRef(val!),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () async {
                          final ImagePicker picker = ImagePicker();
                          XFile? image = await picker.pickImage(
                              source: ImageSource.gallery);
                          if (image != null) {
                            var selectedImage = await image.readAsBytes();
                            aadhaarCardPicture = selectedImage;

                            addMemberCnt.isLoading.value = true;

                            final mountainsRef = storageRef
                                .child("AadhaarCardImages/${image.name}");

                            try {
                              // Upload raw data.
                              await mountainsRef.putData(aadhaarCardPicture);
                              addMemberCnt.aadhaarCardPic =
                                  await mountainsRef.getDownloadURL();
                              if (kDebugMode) {
                                print(
                                    "addMemberCnt.aadhaarCardPic :- ${addMemberCnt.aadhaarCardPic}");
                              }
                              addMemberCnt.isLoading.value = false;
                            } catch (e) {
                              // ...
                              if (kDebugMode) {
                                print(e.toString());
                              }
                              showSnackBar(
                                  context: context, title: e.toString());
                              addMemberCnt.isLoading.value = false;
                            }
                          } else {
                            if (kDebugMode) {
                              print("Image not selected");
                            }
                          }
                        },
                        child: Container(
                          height: 200,
                          width: 250,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all()),
                          alignment: Alignment.center,
                          child: addMemberCnt.aadhaarCardPic == ""
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(Icons.add),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Add Aadhaar Card Photo",
                                      textAlign: TextAlign.center,
                                    )
                                  ],
                                )
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: FadeInImage.memoryNetwork(
                                    placeholder: aadhaarCardPicture,
                                    image: addMemberCnt.aadhaarCardPic,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                        ),
                      ),
                      const SizedBox(
                        width: 100,
                      ),
                      InkWell(
                        onTap: () async {
                          final ImagePicker picker = ImagePicker();
                          XFile? image = await picker.pickImage(
                              source: ImageSource.gallery);
                          if (image != null) {
                            var selectedImage = await image.readAsBytes();
                            panCardPicture = selectedImage;
                            addMemberCnt.isLoading.value = true;
                            final mountainsRef =
                                storageRef.child("PanCard/${image.name}");

                            try {
                              // Upload raw data.
                              await mountainsRef.putData(aadhaarCardPicture);
                              addMemberCnt.panCardPic =
                                  await mountainsRef.getDownloadURL();
                              if (kDebugMode) {
                                print(
                                    "addMemberCnt.panCardPic :- ${addMemberCnt.panCardPic}");
                              }
                              addMemberCnt.isLoading.value = false;
                            } catch (e) {
                              // ...
                              if (kDebugMode) {
                                print(e.toString());
                              }
                              showSnackBar(
                                  context: context, title: e.toString());
                              addMemberCnt.isLoading.value = false;
                            }
                          } else {
                            if (kDebugMode) {
                              print("Image not selected");
                            }
                          }
                        },
                        child: Container(
                          height: 200,
                          width: 250,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all()),
                          alignment: Alignment.center,
                          child: addMemberCnt.panCardPic == ""
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(Icons.add),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Add Pan Card Photo",
                                      textAlign: TextAlign.center,
                                    )
                                  ],
                                )
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: FadeInImage.memoryNetwork(
                                    placeholder: panCardPicture,
                                    image: addMemberCnt.panCardPic,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  CommonButton(
                      title: "Next",
                      onPressed: () {
                        if (addMemberCnt.aadhaarCardPic == "") {
                          showSnackBar(
                              context: context,
                              title: "Select aadhaar card picture");
                        } else if (addMemberCnt.panCardPic == "") {
                          showSnackBar(
                              context: context,
                              title: "Select pan card picture");
                        } else {
                          homeCnt.isTab.value = "BankDetail";
                        }
                      }),
                  const Spacer(),
                ],
              ),
      ),
    );
  }
}
