import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/app_constant.dart';
import '../../utils/app_enums.dart';
import '../../utils/app_method.dart';
import '../../utils/app_style.dart';
import '../../utils/app_text.dart';
import '../providers/character_provider.dart';
import '../widgets/no_response_widget.dart';
import '../widgets/shimmer_character.dart';
import 'character_detail_screen.dart';

class CharactersScreen extends StatelessWidget {
  const CharactersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double bottomPadding = MediaQuery.of(context).padding.bottom;
    return Scaffold(
      backgroundColor: AppConstant.background,
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          AppText.characters,
        ),
        foregroundColor: AppConstant.textColor,
        centerTitle: true,
        iconTheme: IconThemeData(color: AppConstant.textColor),
        backgroundColor: AppConstant.background,
      ),
      body: Consumer<CharacterProvider>(
        builder: (
          BuildContext context,
          CharacterProvider provider,
          Widget? child,
        ) {
          if (provider.state == ScreenState.loading) {
            return ShimmerCharacter(size: size);
          } else if (provider.state == ScreenState.fetched) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: provider.characterList.length,
                    itemBuilder: (context, i) => GestureDetector(
                      onTap: () {
                        AppMethod.pushRoute(
                          context,
                          CharacterDetailScreen(
                            model: provider.characterList[i],
                          ),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(
                          bottom: 20,
                          left: size.width * 0.045,
                          right: size.width * 0.045,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: AppConstant.background,
                          boxShadow: AppStyle.generalBlack,
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: size.width * 0.06),
                            Image.network(
                              (provider.characterList[i].images != null &&
                                      provider.characterList[i].images!.main !=
                                          null)
                                  ? provider.characterList[i].images!.main!
                                  : "",
                              height: 100,
                              width: 100,
                              fit: BoxFit.contain,
                            ),
                            SizedBox(width: size.width * 0.06),
                            Expanded(
                              child: Text(
                                (provider.characterList[i].name != null &&
                                        provider.characterList[i].name!.first !=
                                            null)
                                    ? "${provider.characterList[i].name!.first!} ${provider.characterList[i].name!.last ?? ""}"
                                    : "",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: AppConstant.textColor.withOpacity(0.6),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(width: size.width * 0.06),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: bottomPadding + 20),
                ],
              ),
            );
          } else {
            return NoResponseWidget(size: size, quizeScreen: false);
          }
        },
      ),
    );
  }
}
