import 'package:flutter/material.dart';

import '../../utils/app_color.dart';

class CustomBtn extends StatelessWidget {
  final Size size;
  final String title;
  final Function onTap;
  final Color backgroundColor;
  final Color textColor;
  final double? horizontalPadding;
  final double verticalPadding;
  final double radius;
  final double fontSize;
  const CustomBtn({
    super.key,
    required this.size,
    required this.title,
    required this.onTap,
    this.backgroundColor = AppColor.primary,
    this.textColor = AppColor.whiteColor,
    this.horizontalPadding,
    this.verticalPadding = 15,
    this.radius = 100,
    this.fontSize = 16,
  });

  @override
  Widget build(BuildContext context) {
    if (horizontalPadding == null) {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: backgroundColor,
          foregroundColor: AppColor.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        onPressed: () {
          onTap();
        },
        child: Container(
          width: double.infinity,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(
            vertical: verticalPadding,
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                color: textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      );
    } else {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        onPressed: () {
          onTap();
        },
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(
            vertical: verticalPadding,
            horizontal: horizontalPadding!,
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                fontSize: fontSize,
                color: textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      );
    }
  }
}
