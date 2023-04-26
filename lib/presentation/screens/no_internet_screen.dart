import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/app_constant.dart';
import '../../utils/app_image.dart';
import '../../utils/app_method.dart';
import '../../utils/app_style.dart';
import '../../utils/app_text.dart';
import '../widgets/custom_btn.dart';
import 'splash_screen.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppConstant.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 40,
              horizontal: size.width * 0.05,
            ),
            margin: EdgeInsets.symmetric(
              horizontal: size.width * 0.06,
            ),
            decoration: BoxDecoration(
              color: AppConstant.background,
              borderRadius: BorderRadius.circular(12),
              boxShadow: AppStyle.generalBlack,
            ),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    AppImage.noInternet,
                    height: 100,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  AppText.checkInternet,
                  style: TextStyle(
                    fontSize: 16,
                    color: AppConstant.textColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              SizedBox(width: size.width * 0.08),
              Expanded(
                child: CustomBtn(
                  size: size,
                  title: AppText.exit,
                  onTap: () {
                    SystemNavigator.pop();
                  },
                ),
              ),
              SizedBox(width: size.width * 0.08),
              Expanded(
                child: CustomBtn(
                  size: size,
                  title: AppText.restart,
                  onTap: () {
                    AppMethod.pushAndRemoveAllRoute(
                      context,
                      const SplashScreen(),
                    );
                  },
                ),
              ),
              SizedBox(width: size.width * 0.08),
            ],
          ),
        ],
      ),
    );
  }
}
