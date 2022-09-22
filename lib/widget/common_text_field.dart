import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tms_app/utils/color_utils.dart';

class MyTextBox extends StatelessWidget {
  final TextEditingController? controller;
  final String? error;
  final String? helperText;
  final Widget? helperWidget;

  final bool? obscureText;
  final FocusNode? focusNode;
  final void Function(String)? onEditingComplete;
  final void Function(String)? onChanged;

  final bool? isEnable;
  final bool? autoFocus;

  final FocusNode? nextFocus;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final int? maxLength;
  final int maxLines;
  final TextAlign? textAlign;

  final List<TextInputFormatter>? inputFormatters;

  final Key? textFieldKey;

  final String? hintText;

  const MyTextBox({
    Key? key,
    this.controller,
    this.autoFocus,
    this.helperText,
    this.helperWidget,
    this.onChanged,
    this.obscureText,
    required this.error,
    this.hintText,
    this.focusNode,
    this.onEditingComplete,
    this.inputFormatters,
    this.isEnable,
    this.keyboardType,
    this.maxLength,
    this.maxLines = 1,
    this.nextFocus,
    this.textAlign,
    this.textFieldKey,
    this.textInputAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                helperText!,
                style: TextStyle(
                    color: error != "" ? Colors.red : AppColors.black),
              ),
              const Spacer(),
              helperWidget != null ? helperWidget! : Container(),
            ],
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: controller,
            focusNode: focusNode,
            autofocus: autoFocus ?? false,
            decoration: InputDecoration(
              hintText: hintText,
              // errorText: error != "" ? error! : "",
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: error != "" ? Colors.red : AppColors.color909CA2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: error != "" ? Colors.red : AppColors.color909CA2),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: error != "" ? Colors.red : AppColors.color909CA2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              contentPadding: const EdgeInsets.all(10),
              counterText: "",
              hintStyle:
                  TextStyle(color: AppColors.black.withOpacity(0.5)).copyWith(),
              fillColor: Colors.transparent,
              filled: true,
            ),
            onFieldSubmitted: onEditingComplete,
            obscuringCharacter: "*",
            key: textFieldKey,
            enabled: isEnable ?? true,
            cursorColor: Colors.black,
            maxLength: maxLength,
            maxLines: maxLines,
            textAlign: textAlign ?? TextAlign.left,
            inputFormatters: inputFormatters,
            obscureText: obscureText ?? false,
            keyboardType: keyboardType,
            textInputAction: textInputAction,
            onChanged: onChanged,
            onEditingComplete: () {
              focusNode?.unfocus();
              FocusScope.of(context).requestFocus(nextFocus);
            },
          ),
          error != ""
              ? Container(
                  alignment: Alignment.centerLeft,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5),
                  child: Text(
                    error!,
                    style: const TextStyle(
                      color: Colors.red,
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
