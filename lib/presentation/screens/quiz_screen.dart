import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/app_color.dart';
import '../../utils/app_constant.dart';
import '../../utils/app_enums.dart';
import '../../utils/app_style.dart';
import '../../utils/app_text.dart';
import '../providers/quiz_provider.dart';
import '../widgets/custom_btn.dart';
import '../widgets/no_response_widget.dart';
import '../widgets/shimmer_quiz.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double bottomPadding = MediaQuery.of(context).padding.bottom;
    return WillPopScope(
      onWillPop: () async {
        Provider.of<QuizProvider>(context, listen: false).disposeQuizState();
        Navigator.of(context).pop();
        return false;
      },
      child: Scaffold(
        backgroundColor: AppConstant.background,
        body: Consumer<QuizProvider>(
          builder: (
            BuildContext context,
            QuizProvider provider,
            Widget? child,
          ) {
            if (provider.state == ScreenState.loading) {
              return ShimmerQuiz(size: size);
            } else if (provider.state == ScreenState.fetched) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    AppBar(
                      elevation: 0,
                      title: Text(
                        "${AppText.question}: ${provider.currentQution + 1} / ${provider.questionList.length}",
                      ),
                      foregroundColor: AppConstant.textColor,
                      centerTitle: true,
                      iconTheme: IconThemeData(color: AppConstant.textColor),
                      backgroundColor: AppConstant.background,
                      leading: IconButton(
                        icon: Icon(
                          Platform.isAndroid
                              ? Icons.arrow_back
                              : Icons.arrow_back_ios,
                          color: AppConstant.textColor,
                        ),
                        onPressed: () {
                          Provider.of<QuizProvider>(context, listen: false)
                              .disposeQuizState();
                          Navigator.of(context).pop();
                        },
                      ),
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
                                child: Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.045,
                                    vertical: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: AppConstant.background,
                                    boxShadow: AppStyle.generalBlack,
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        AppText.correct,
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: AppConstant.textColor,
                                        ),
                                      ),
                                      Expanded(child: Container()),
                                      Text(
                                        provider.correct.toString(),
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: AppColor.primary,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: size.width * 0.06),
                              Expanded(
                                child: Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.045,
                                    vertical: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: AppConstant.background,
                                    boxShadow: AppStyle.generalBlack,
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        AppText.wrong,
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: AppConstant.textColor,
                                        ),
                                      ),
                                      Expanded(child: Container()),
                                      Text(
                                        provider.wrong.toString(),
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: AppColor.primary,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Text(
                            provider
                                .questionList[provider.currentQution].question,
                            style: TextStyle(
                              fontSize: 20,
                              color: AppConstant.textColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 20),
                          ValueListenableBuilder(
                            valueListenable: provider.selectedAnswer,
                            builder: (context, selectedIndex, child) =>
                                ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: provider
                                  .questionList[provider.currentQution]
                                  .possibleAnswers
                                  .length,
                              itemBuilder: (context, i) => GestureDetector(
                                onTap: () {
                                  provider.onAnswerSelect(i);
                                },
                                child: Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: size.width * 0.04,
                                  ),
                                  margin: const EdgeInsets.only(bottom: 15),
                                  decoration: BoxDecoration(
                                    color: selectedIndex == i
                                        ? AppColor.primary.withOpacity(0.6)
                                        : AppConstant.background,
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(
                                      width: 1,
                                      color: AppColor.primary,
                                    ),
                                  ),
                                  child: Text(
                                    provider
                                        .questionList[provider.currentQution]
                                        .possibleAnswers[i],
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: AppConstant.textColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          CustomBtn(
                            size: size,
                            title: AppText.next,
                            onTap: () {
                              provider.nextClick(context);
                            },
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                    SizedBox(height: bottomPadding),
                  ],
                ),
              );
            } else {
              return NoResponseWidget(size: size, quizeScreen: true);
            }
          },
        ),
      ),
    );
  }
}
