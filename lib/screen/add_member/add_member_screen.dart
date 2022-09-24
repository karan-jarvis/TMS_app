import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tms_app/screen/add_member/add_member_cnt.dart';
import 'package:tms_app/screen/login/login_cnt.dart';
import 'package:tms_app/utils/color_utils.dart';
import 'package:tms_app/widget/common_button.dart';
import 'package:tms_app/widget/common_text_field.dart';

class AddMemberScreen extends StatefulWidget {
  AddMemberScreen({Key? key}) : super(key: key);

  @override
  State<AddMemberScreen> createState() => _AddMemberScreenState();
}

class _AddMemberScreenState extends State<AddMemberScreen> {
  AddMemberController addMemberCnt = Get.put(AddMemberController());

  @override
  Widget build(BuildContext context) {
    addMemberCnt.nameController.value.text = "Karan";
    addMemberCnt.emailController.value.text = "Karan@dev.com";
    addMemberCnt.phoneController.value.text = "2522151431";
    addMemberCnt.residentAddressController.value.text = "e-1";
    return Obx(
      () => Padding(
        padding: const EdgeInsets.only(top: 20, left: 100, right: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text("Add User",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: AppColors.color6C0BA9)),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    MyTextBox(
                      controller: addMemberCnt.nameController.value,
                      hintText: "Please Enter name",
                      helperText: "Name *",
                      error: addMemberCnt.nameError,
                      focusNode: addMemberCnt.nameFocusNode,
                      nextFocus: addMemberCnt.emailFocusNode,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      onChanged: (String? val) => addMemberCnt.checkName(val!),
                      onEditingComplete: (String? val) =>
                          addMemberCnt.checkName(val!),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    MyTextBox(
                      controller: addMemberCnt.emailController.value,
                      helperText: "Email address *",
                      focusNode: addMemberCnt.emailFocusNode,
                      nextFocus: addMemberCnt.passwordFN,
                      hintText: "Enter your email",
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      error: addMemberCnt.emailError,
                      onChanged: (String? val) => addMemberCnt.checkEmail(val!),
                      onEditingComplete: (String? val) =>
                          addMemberCnt.checkEmail(val!),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    MyTextBox(
                      controller: addMemberCnt.passwordController.value,
                      helperText: "Password *",
                      onChanged: (String? val) =>
                          addMemberCnt.checkPassword(val),
                      isEnable: true,
                      focusNode: addMemberCnt.passwordFN,
                      nextFocus: addMemberCnt.phoneFocusNode,
                      inputFormatters: [
                        FilteringTextInputFormatter(
                          RegExp(InputConstants.password),
                          allow: true,
                        ),
                      ],
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      hintText: "Enter your password",
                      error: addMemberCnt.passwordError,
                      onEditingComplete: (String? val) =>
                          addMemberCnt.checkPassword(val),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    MyTextBox(
                      controller: addMemberCnt.phoneController.value,
                      helperText: "Phone number *",
                      inputFormatters: [LengthLimitingTextInputFormatter(10)],
                      focusNode: addMemberCnt.phoneFocusNode,
                      nextFocus: addMemberCnt.residentAddressFocusNode,
                      hintText: "Enter your Phone Number",
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.next,
                      error: addMemberCnt.phoneError,
                      onChanged: (String? val) => addMemberCnt.checkPhone(val!),
                      onEditingComplete: (String? val) =>
                          addMemberCnt.checkPhone(val!),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    MyTextBox(
                      controller: addMemberCnt.residentAddressController.value,
                      helperText: "Address *",
                      focusNode: addMemberCnt.residentAddressFocusNode,
                      nextFocus: addMemberCnt.residentAddressFocusNode,
                      hintText: "Enter your Address",
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      error: addMemberCnt.residentAddressError,
                      onChanged: (String? val) =>
                          addMemberCnt.checkAddress(val!),
                      onEditingComplete: (String? val) =>
                          addMemberCnt.checkAddress(val!),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () => addMemberCnt.selectProfilePic(context),
                          child: Container(
                            height: 200,
                            width: 250,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all()),
                            alignment: Alignment.center,
                            child: addMemberCnt.isLoading.value
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : addMemberCnt.profilePic == ""
                                    ? Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Icon(Icons.add),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "Add Profile Photo",
                                            textAlign: TextAlign.center,
                                          )
                                        ],
                                      )
                                    : ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: FadeInImage.memoryNetwork(
                                          placeholder:
                                              addMemberCnt.profilePicture,
                                          image: addMemberCnt.profilePic,
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
                    SizedBox(
                      width: 500,
                      child: CommonButton(
                          title: "Next",
                          onPressed: () {
                            //Todo:-  change before submit
                            // if (addMemberCnt.profilePic == "") {
                            //   showSnackBar(
                            //       context: context,
                            //       title: "Select the profile photo");
                            // } else {
                            addMemberCnt.onSubmit(context);
                            //}
                          }),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
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
