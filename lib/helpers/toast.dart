import 'package:bnp_app/constants/color.dart';
import 'package:bnp_app/constants/text_font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:fluttertoast/fluttertoast.dart';



final class ToastUtil {
  ToastUtil._();

  static void showErrorMessage(String message) {
    Get.snackbar(
      titleText: Text(
        "Warning",
        style: TextFontStyle.headline20w400c3D4040mina,
      ),
      messageText: Text(
        message,
        style: TextFontStyle.headline16w200cA0A4B8sfPro,
      ),
      "",
      message,
      backgroundColor: Colors.red,
      borderRadius: 26.r,
      margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 8.h, bottom: 12.h),
      snackPosition: SnackPosition.TOP,
    );
  }

  static void showSuccessMessage(String message) {
    Get.snackbar(
      titleText: Text(
        "Successful",
        style: TextFontStyle.headline20w400c3D4040mina,
      ),
      messageText: Text(
        message,
        style: TextFontStyle.headline16w200cA0A4B8sfPro,
      ),
      "",
      message,
      backgroundColor: AppColor.primaryCOlor,
      borderRadius: 26.r,
      margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 8.h, bottom: 10.h),
      snackPosition: SnackPosition.TOP,
    );
  }


  
  static void showShortToast(String message) {
    Fluttertoast.showToast(
      msg: message.tr,
      toastLength: Toast.LENGTH_SHORT,
    );
  }

    static void showLongToast(String message) {
    String trn = message.tr;
    Fluttertoast.showToast(
      msg: trn,
      toastLength: Toast.LENGTH_LONG,
    );
  }

  
}