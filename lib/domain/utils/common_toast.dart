import 'package:fluttertoast/fluttertoast.dart';

import '../../utils/app_color.dart';

class CommonToast {
  static void showToast(String message, {bool error = true}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: error ? AppColor.red : AppColor.green,
      textColor: AppColor.whiteColor,
      fontSize: 16.0,
    );
  }
}
