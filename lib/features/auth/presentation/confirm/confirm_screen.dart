
import 'package:bnp_app/common/custom_button.dart';
import 'package:bnp_app/constants/text_font_style.dart';
import 'package:bnp_app/gen/assets.gen.dart';
import 'package:bnp_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ConfirmScreen extends StatefulWidget {
  const ConfirmScreen({super.key});

  @override
  State<ConfirmScreen> createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends State<ConfirmScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: SvgPicture.asset(Assets.icons.confirmIcon)),
            UIHelper.verticalSpace(24.h),
            Text(
              "Hello Farzid",
              style: TextFontStyle.headline18w600c1A1A1AsfPro,
            ),
            UIHelper.verticalSpace(4.h),
            Text(
              "You’re all set!",
              style: TextFontStyle.headline16w600C9A9A9AsfPro,
            ),
            UIHelper.verticalSpace(40.h),
            CustomButton(
              onTap: () {},
              btnName: "Get Started",
              borderRadius: 100.r,
            ),
          ],
        ),
      ),
    );
  }
}
