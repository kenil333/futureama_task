import '../../data/helper/pref_helper.dart';

class PrefRepository {
  final String theme = "Theme";
  Future<bool> getTheTheme() async {
    return await PrefHelper.getBool(theme);
  }

  Future<void> setTheTheme(bool value) async {
    await PrefHelper.setBool(theme, value);
  }
}
