import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:salesforce/res/colors/app_colors.dart';

class Utils {
  static void fieldFocusChange(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    Focus.of(context).requestFocus(nextFocus);
  }

  static toastMessageBottom(String message) {
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: AppColor.blackColor,
        gravity: ToastGravity.BOTTOM
    );
  }

  static toastMessageCenter(String message) {
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: AppColor.blackColor,
        gravity: ToastGravity.CENTER
    );
  }

  static snackBar(String title, String message) {
    Get.snackbar(title, message);
  }
}