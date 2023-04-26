// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../data/model/info_model.dart';
import '../../domain/repository/api_repository.dart';
import '../../domain/repository/pref_repository.dart';
import '../../utils/app_color.dart';
import '../../utils/app_constant.dart';
import '../../utils/app_method.dart';
import '../../utils/app_style.dart';
import '../screens/home_screen.dart';

class InfoProvider extends ChangeNotifier {
  final ApiRepository apiRepo = ApiRepository();
  final PrefRepository prefRepo = PrefRepository();

  InfoModel? _info;

  InfoModel? get info => _info;

  Future<void> fetchingInfo(BuildContext context) async {
    final bool dark = await prefRepo.getTheTheme();
    if (dark) {
      AppConstant.textColor = AppColor.whiteColor;
      AppConstant.background = AppColor.screenbackdark;
      AppStyle.generalBlack = AppStyle.whiteShadow;
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    } else {
      AppConstant.textColor = AppColor.blackColor;
      AppConstant.background = AppColor.whiteColor;
      AppStyle.generalBlack = AppStyle.blackShadow;
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    }
    AppConstant.dark.value = dark;
    final List<InfoModel> list = await apiRepo.getInfo();
    debugPrint("=====> List Length :::::  ${list.length}");
    if (list.isNotEmpty) {
      _info = list[0];
      notifyListeners();
      AppMethod.pushReplacementRoute(context, const HomeScreen());
    }
  }

  void changeTheme(bool value) async {
    if (value) {
      AppConstant.textColor = AppColor.whiteColor;
      AppConstant.background = AppColor.screenbackdark;
      AppStyle.generalBlack = AppStyle.whiteShadow;
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    } else {
      AppConstant.textColor = AppColor.blackColor;
      AppConstant.background = AppColor.whiteColor;
      AppStyle.generalBlack = AppStyle.blackShadow;
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    }
    await prefRepo.setTheTheme(value);
    AppConstant.dark.value = value;
  }
}
