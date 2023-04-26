import 'package:flutter/material.dart';

import '../../utils/app_constant.dart';
import '../../utils/app_text.dart';

class NoResponseWidget extends StatelessWidget {
  final Size size;
  final bool quizeScreen;
  const NoResponseWidget({
    super.key,
    required this.size,
    required this.quizeScreen,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        quizeScreen ? AppText.questionsNotFound : AppText.charactersNotFound,
        style: TextStyle(
          fontSize: 16,
          color: AppConstant.textColor,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
