import 'package:shared_preferences/shared_preferences.dart';

class PrefHelper {
  static Future<bool> getBool(String key) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getBool(key) ?? false;
  }

  static Future<void> setBool(String key, bool value) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setBool(key, value);
  }
}
