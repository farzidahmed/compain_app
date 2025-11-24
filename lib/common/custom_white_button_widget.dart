

import 'package:bnp_app/constants/color.dart';
import 'package:bnp_app/constants/text_font_style.dart';
import 'package:bnp_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomWhiteButtonWIdget extends StatelessWidget {
  final VoidCallback onTap;
  const CustomWhiteButtonWIdget({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(0x142C3E50),
              blurRadius: 4,
              offset: Offset(0, 1),
              spreadRadius: 0,
            ),
          ],
          color: AppColor.cFFFFFF,
          borderRadius: BorderRadius.circular(100.r),
        ),
        child: Row(
          spacing: 6.w,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Or Log in with",
              style: TextFontStyle.headline16w400c52595FsfPro.copyWith(
                color: AppColor.c6C757D,
              ),
            ),
            SvgPicture.asset(Assets.icons.googleIcon6),
          ],
        ),
      ),
    );
  }
}
