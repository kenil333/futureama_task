import 'package:flutter/material.dart';

import '../../utils/app_color.dart';
import '../../utils/app_constant.dart';

class DetailValueWidget extends StatelessWidget {
  final Size size;
  final String title;
  final String value;
  const DetailValueWidget({
    super.key,
    required this.size,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.04,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppConstant.background,
        border: Border.all(
          width: 1,
          color: AppColor.primary,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              color: AppConstant.textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.fade,
            style: TextStyle(
              fontSize: 12,
              color: AppConstant.textColor,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
