import 'package:flutter/material.dart';

import '../../data/model/character_model.dart';
import '../../utils/app_color.dart';
import '../../utils/app_constant.dart';
import '../../utils/app_style.dart';
import '../../utils/app_text.dart';
import '../widgets/detail_value_widget.dart';

class CharacterDetailScreen extends StatelessWidget {
  final CharacterModel model;
  const CharacterDetailScreen({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double bottomPadding = MediaQuery.of(context).padding.bottom;
    return Scaffold(
      backgroundColor: AppConstant.background,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          (model.name != null && model.name!.first != null)
              ? "${model.name!.first!} ${model.name!.last ?? ""}"
              : "",
        ),
        foregroundColor: AppConstant.textColor,
        centerTitle: true,
        iconTheme: IconThemeData(color: AppConstant.textColor),
        backgroundColor: AppConstant.background,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: size.width * 0.5,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppConstant.background,
                      boxShadow: AppStyle.generalOrange,
                    ),
                    child: Image.network(
                      (model.images != null && model.images!.main != null)
                          ? model.images!.main!
                          : "",
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(width: size.width * 0.04),
                  Expanded(
                    child: Column(
                      children: [
                        DetailValueWidget(
                          size: size,
                          title: AppText.gender,
                          value: model.gender ?? "",
                        ),
                        const SizedBox(height: 10),
                        DetailValueWidget(
                          size: size,
                          title: AppText.species,
                          value: model.species ?? "",
                        ),
                        const SizedBox(height: 10),
                        DetailValueWidget(
                          size: size,
                          title: AppText.homePlanet,
                          value: model.homePlanet ?? "",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              DetailValueWidget(
                size: size,
                title: AppText.name,
                value:
                    "${model.name!.first ?? ""} ${model.name!.middle ?? ""} ${model.name!.last ?? ""}",
              ),
              const SizedBox(height: 15),
              DetailValueWidget(
                size: size,
                title: AppText.occupation,
                value: model.occupation ?? "",
              ),
              const SizedBox(height: 20),
              const Text(
                AppText.sayings,
                style: TextStyle(
                  fontSize: 22,
                  color: AppColor.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppConstant.background,
                  boxShadow: AppStyle.generalOrange,
                ),
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: model.sayings.length,
                  itemBuilder: (context, i) => Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.04,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      border: i == (model.sayings.length - 1)
                          ? null
                          : const Border(
                              bottom: BorderSide(
                                width: 1,
                                color: AppColor.primary,
                              ),
                            ),
                    ),
                    child: Text(
                      model.sayings[i],
                      style: TextStyle(
                        fontSize: 12,
                        color: AppConstant.textColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: bottomPadding + 20),
            ],
          ),
        ),
      ),
    );
  }
}
