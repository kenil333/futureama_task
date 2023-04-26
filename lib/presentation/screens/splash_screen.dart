import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/app_constant.dart';
import '../../utils/app_image.dart';
import '../providers/info_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1)).then((value) async {
      final InfoProvider infoProvider =
          Provider.of<InfoProvider>(context, listen: false);
      await infoProvider.fetchingInfo(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppConstant.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                AppImage.appLogo,
                width: size.width * 0.2,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
