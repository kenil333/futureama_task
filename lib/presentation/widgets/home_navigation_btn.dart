import 'package:flutter/material.dart';

import '../../utils/app_constant.dart';
import '../../utils/app_style.dart';

class HomeNavigationBtn extends StatelessWidget {
  final Size size;
  final String title;
  final String img;
  final Function onClick;
  const HomeNavigationBtn({
    super.key,
    required this.size,
    required this.title,
    required this.img,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          onClick();
        },
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            vertical: 15,
            horizontal: size.width * 0.045,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppConstant.background,
            boxShadow: AppStyle.generalBlack,
          ),
          child: Column(
            children: [
              const SizedBox(height: 15),
              Image.asset(
                img,
                height: 100,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 18),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  color: AppConstant.textColor.withOpacity(0.6),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
