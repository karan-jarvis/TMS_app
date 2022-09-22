import 'package:flutter/material.dart';
import 'package:tms_app/utils/color_utils.dart';

class SquareDetailBox extends StatelessWidget {
  SquareDetailBox({Key? key, required this.title, required this.value})
      : super(key: key);

  String title;
  String value;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      color: AppColors.white,
      borderRadius: BorderRadius.circular(20),
      child: SizedBox(
        height: 180,
        width: 180,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: AppColors.colorA44CD3)),
            SizedBox(
              height: 10,
            ),
            Text(value,
                style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: AppColors.colorA44CD3))
          ],
        ),
      ),
    );
  }
}
