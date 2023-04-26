import 'package:flutter/material.dart';

import '../../utils/app_constant.dart';
import '../../utils/app_text.dart';
import '../widgets/custom_btn.dart';

class QuizResultScreen extends StatelessWidget {
  final int correct;
  final int total;
  const QuizResultScreen({
    super.key,
    required this.correct,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppConstant.background,
      appBar: AppBar(
        elevation: 0,
        title: const Text(AppText.result),
        foregroundColor: AppConstant.textColor,
        centerTitle: true,
        iconTheme: IconThemeData(color: AppConstant.textColor),
        backgroundColor: AppConstant.background,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
              child: Text(
                "You have answered $correct out of $total correctly.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: AppConstant.textColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                Expanded(child: Container()),
                CustomBtn(
                  size: size,
                  title: AppText.done,
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  horizontalPadding: 20,
                ),
                Expanded(child: Container()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
