import 'package:bnp_app/constants/color.dart';
import 'package:bnp_app/constants/text_font_style.dart';
import 'package:bnp_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.cB1DAE0,
      body: Container(
        decoration: BoxDecoration(color: AppColor.cB1DAE0),
        child: Column(
          spacing: 8.h,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                Assets.images.milton.path,
                width: 242.w,
                height: 242.h,
              ),
            ),
            Text(
              "Safiqul Islam Khan Milton".tr,
              style: TextFontStyle.headline16w400c3D4040mina,
            ),
          ],
        ),
      ),
    );
  }
}
