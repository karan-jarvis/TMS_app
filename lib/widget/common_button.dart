import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tms_app/utils/color_utils.dart';

class CommonButton extends StatelessWidget {
  CommonButton({Key? key, required this.title, required this.onPressed})
      : super(key: key);

  String title;
  void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      child: Text(title),
      color: AppColors.color83B4CF,
    );
  }
}

void showSnackBar({required context, required String title}) {
  var snackBar = SnackBar(content: Text(title));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
