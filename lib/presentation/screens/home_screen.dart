import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:provider/provider.dart';

import '../../data/model/info_model.dart';
import '../../utils/app_color.dart';
import '../../utils/app_constant.dart';
import '../../utils/app_image.dart';
import '../../utils/app_method.dart';
import '../../utils/app_style.dart';
import '../../utils/app_text.dart';
import '../providers/character_provider.dart';
import '../providers/info_provider.dart';
import '../providers/quiz_provider.dart';
import '../widgets/home_navigation_btn.dart';
import 'characters_screen.dart';
import 'quiz_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final InfoProvider infoProvider =
        Provider.of<InfoProvider>(context, listen: false);
    final InfoModel info = infoProvider.info!;
    final Size size = MediaQuery.of(context).size;
    final double topPadding = MediaQuery.of(context).padding.top;
    final double bottomPadding = MediaQuery.of(context).padding.bottom;
    return WillPopScope(
      onWillPop: () async {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: AppConstant.background,
            title: Text(
              AppText.areYouSure,
              style: TextStyle(
                color: AppConstant.textColor.withOpacity(0.6),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            content: Text(
              AppText.doYouWantToExit,
              style: TextStyle(
                color: AppConstant.textColor,
                fontSize: 16,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text(
                  AppText.no,
                  style: TextStyle(
                    color: AppColor.primary,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextButton(
                onPressed: () => SystemNavigator.pop(),
                child: const Text(
                  AppText.yes,
                  style: TextStyle(
                    color: AppColor.primary,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        );
        return false;
      },
      child: ValueListenableBuilder(
        valueListenable: AppConstant.dark,
        builder: (context, dark, child) => Scaffold(
          backgroundColor: AppConstant.background,
          body: Column(
            children: [
              SizedBox(height: topPadding),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.06,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    AppText.yearsAired,
                                    style: TextStyle(
                                      fontSize: 22,
                                      color: AppColor.primary,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    info.yearsAired ?? "",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: AppConstant.textColor
                                          .withOpacity(0.6),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                FlutterSwitch(
                                  value: dark,
                                  onToggle: (bool value) {
                                    infoProvider.changeTheme(value);
                                  },
                                  height: 22,
                                  width: 38,
                                  padding: 2,
                                  borderRadius: 100,
                                  toggleSize: 20,
                                  activeColor: AppColor.primary,
                                  inactiveColor:
                                      AppConstant.textColor.withOpacity(0.2),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  dark ? AppText.dark : AppText.light,
                                  style: TextStyle(
                                    fontSize: 10,
                                    color:
                                        AppConstant.textColor.withOpacity(0.6),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          AppText.creators,
                          style: TextStyle(
                            fontSize: 22,
                            color: AppColor.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 2),
                        GridView.builder(
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: info.creators.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: size.width * 0.06,
                            mainAxisSpacing: 20,
                            childAspectRatio: 4,
                          ),
                          itemBuilder: (BuildContext context, int i) => InkWell(
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: AppConstant.background,
                                boxShadow: AppStyle.generalBlack,
                              ),
                              child: Center(
                                child: Text(
                                  info.creators[i].name ?? "",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color:
                                        AppConstant.textColor.withOpacity(0.6),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        const Text(
                          AppText.synopsis,
                          style: TextStyle(
                            fontSize: 22,
                            color: AppColor.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Container(
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
                          child: Text(
                            info.synopsis ?? "",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontSize: 12,
                              color: AppConstant.textColor.withOpacity(0.6),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        const SizedBox(height: 25),
                        Row(
                          children: [
                            HomeNavigationBtn(
                              size: size,
                              title: AppText.characters,
                              img: AppImage.characters,
                              onClick: () {
                                final CharacterProvider charProvider =
                                    Provider.of<CharacterProvider>(context,
                                        listen: false);
                                charProvider.fetchingCharacters();
                                AppMethod.pushRoute(
                                  context,
                                  const CharactersScreen(),
                                );
                              },
                            ),
                            SizedBox(width: size.width * 0.06),
                            HomeNavigationBtn(
                              size: size,
                              title: AppText.quiz,
                              img: AppImage.quiz,
                              onClick: () {
                                final QuizProvider quizProvider =
                                    Provider.of<QuizProvider>(
                                  context,
                                  listen: false,
                                );
                                quizProvider.fetchingQuestions();
                                AppMethod.pushRoute(
                                  context,
                                  const QuizScreen(),
                                );
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: bottomPadding + 20),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
