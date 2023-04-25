import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MobileColor.patientPrimaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              MobileImage.raxaLogo,
              width: MobileMethods.getSize(size.width, 71),
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 16),
            Text(
              MobileText.splashTxt,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: MobileMethods.getSize(size.width, 14),
                color: MobileColor.authTxtColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
