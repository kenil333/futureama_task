import 'package:flutter/material.dart';

import 'app_color.dart';

class AppStyle {
  static List<BoxShadow> blackShadow = [
    BoxShadow(
      color: AppColor.blackColor.withOpacity(0.15),
      spreadRadius: 0,
      blurRadius: 6,
      offset: const Offset(0, 3),
    ),
  ];

  static List<BoxShadow> whiteShadow = [
    BoxShadow(
      color: AppColor.whiteColor.withOpacity(0.15),
      spreadRadius: 0,
      blurRadius: 6,
      offset: const Offset(0, 3),
    ),
  ];

  static List<BoxShadow> generalBlack = blackShadow;

  static List<BoxShadow> generalOrange = [
    BoxShadow(
      color: AppColor.primary.withOpacity(0.5),
      spreadRadius: 0,
      blurRadius: 6,
      offset: const Offset(0, 0),
    ),
  ];
}
