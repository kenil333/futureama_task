import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../utils/app_constant.dart';

class ShimmerQuiz extends StatelessWidget {
  final Size size;
  const ShimmerQuiz({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          AppBar(
            elevation: 0,
            title: const Text(
              "",
            ),
            foregroundColor: AppConstant.textColor,
            centerTitle: true,
            iconTheme: IconThemeData(color: AppConstant.textColor),
            backgroundColor: AppConstant.background,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.06,
              vertical: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Shimmer.fromColors(
                        baseColor: AppConstant.textColor.withOpacity(0.2),
                        highlightColor: AppConstant.background,
                        child: Container(
                          width: double.infinity,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: AppConstant.textColor.withOpacity(0.2),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: size.width * 0.06),
                    Expanded(
                      child: Shimmer.fromColors(
                        baseColor: AppConstant.textColor.withOpacity(0.2),
                        highlightColor: AppConstant.background,
                        child: Container(
                          width: double.infinity,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: AppConstant.textColor.withOpacity(0.2),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 60),
                for (int i = 0; i < 4; i++)
                  Column(
                    children: [
                      Shimmer.fromColors(
                        baseColor: AppConstant.textColor.withOpacity(0.2),
                        highlightColor: AppConstant.background,
                        child: Container(
                          width: double.infinity,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: AppConstant.textColor.withOpacity(0.2),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                    ],
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
