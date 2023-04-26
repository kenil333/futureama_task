import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../utils/app_constant.dart';
import '../../utils/app_style.dart';

class ShimmerCharacter extends StatelessWidget {
  final Size size;
  const ShimmerCharacter({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          for (int i = 0; i < 8; i++)
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                bottom: 20,
                left: size.width * 0.045,
                right: size.width * 0.045,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.05,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: AppConstant.background,
                boxShadow: AppStyle.generalBlack,
              ),
              child: Row(
                children: [
                  Shimmer.fromColors(
                    baseColor: AppConstant.textColor.withOpacity(0.2),
                    highlightColor: AppConstant.background,
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppConstant.textColor.withOpacity(0.2),
                      ),
                    ),
                  ),
                  SizedBox(width: size.width * 0.06),
                  Expanded(
                    child: Row(
                      children: [
                        SizedBox(width: size.width * 0.12),
                        Expanded(
                          child: Shimmer.fromColors(
                            baseColor: AppConstant.textColor.withOpacity(0.2),
                            highlightColor: AppConstant.background,
                            child: Container(
                              height: 40,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: AppConstant.textColor.withOpacity(0.2),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: size.width * 0.12),
                      ],
                    ),
                  ),
                ],
              ),
            )
        ],
      ),
    );
  }
}
