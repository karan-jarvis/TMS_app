import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tms_app/screen/add_member/add_member_cnt.dart';
import 'package:tms_app/widget/common_button.dart';
import 'package:tms_app/widget/common_text_field.dart';

class AddBankDetailScreen extends StatefulWidget {
  const AddBankDetailScreen({Key? key}) : super(key: key);

  @override
  State<AddBankDetailScreen> createState() => _AddBankDetailScreenState();
}

class _AddBankDetailScreenState extends State<AddBankDetailScreen> {
  AddMemberController addMemberCnt = Get.find<AddMemberController>();

  @override
  Widget build(BuildContext context) {
    // addMemberCnt.accountNumberController.value.text = "1234 1234 1234 1234";
    // addMemberCnt.ifscCodeController.value.text = "12345678";
    // addMemberCnt.bankNameController.value.text = "Lena Bank";
    // addMemberCnt.holderNameController.value.text = "Titanium Blued";
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
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
                    addMemberCnt.homeCnt.isTab.value = "AddUserTwo";
                  },
                  icon: const Icon(Icons.arrow_back_ios)),
            ],
          ),
        ),
        Spacer(),
        SizedBox(
          height: 20,
        ),
        MyTextBox(
          controller: addMemberCnt.accountNumberController.value,
          hintText: "Please Enter Account Number",
          helperText: "Account Number",
          error: addMemberCnt.accountNumberError,
          focusNode: addMemberCnt.accountNumberFocusNode,
          nextFocus: addMemberCnt.ifscCodeFocusNode,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          onChanged: (String? val) => addMemberCnt.checkAccountNumber(val!),
          onEditingComplete: (String? val) =>
              addMemberCnt.checkAccountNumber(val!),
        ),
        SizedBox(
          height: 20,
        ),
        MyTextBox(
          controller: addMemberCnt.ifscCodeController.value,
          hintText: "Please Enter IFSC Code",
          helperText: "IFSC Code",
          error: addMemberCnt.ifscCodeError,
          focusNode: addMemberCnt.ifscCodeFocusNode,
          nextFocus: addMemberCnt.bankNameFocusNode,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          onChanged: (String? val) => addMemberCnt.checkISFCCode(val!),
          onEditingComplete: (String? val) => addMemberCnt.checkISFCCode(val!),
        ),
        SizedBox(
          height: 20,
        ),
        MyTextBox(
          controller: addMemberCnt.bankNameController.value,
          hintText: "Please Enter Bank Name",
          helperText: "Bank Name",
          error: addMemberCnt.bankNameError,
          focusNode: addMemberCnt.bankNameFocusNode,
          nextFocus: addMemberCnt.holderNameFocusNode,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          onChanged: (String? val) => addMemberCnt.checkBankName(val!),
          onEditingComplete: (String? val) => addMemberCnt.checkBankName(val!),
        ),
        SizedBox(
          height: 20,
        ),
        MyTextBox(
          controller: addMemberCnt.holderNameController.value,
          hintText: "Please Enter Account Holder Name",
          helperText: "Account Holder Name",
          error: addMemberCnt.holderNameError,
          focusNode: addMemberCnt.holderNameFocusNode,
          nextFocus: addMemberCnt.holderNameFocusNode,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          onChanged: (String? val) => addMemberCnt.checkHolderName(val!),
          onEditingComplete: (String? val) =>
              addMemberCnt.checkHolderName(val!),
        ),
        const SizedBox(
          height: 30,
        ),
        CommonButton(
          title: "Create",
          onPressed: () => addMemberCnt.onCreate(context),
        ),
        Spacer(),
      ],
    );
  }
}
