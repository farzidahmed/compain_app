import 'package:bnp_app/constants/color.dart';
import 'package:bnp_app/constants/text_font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String btnName;
  final TextStyle? textStyle;
  final double? borderRadius;
  final Color? bgColor;
  const CustomButton({
    super.key,
    required this.onTap,
    required this.btnName,
    this.textStyle,
    this.borderRadius, this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 54.h,
        alignment: Alignment.center,
        decoration: ShapeDecoration(
          color:bgColor?? AppColor.primaryCOlor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 8),
          ),
        ),
        child: Text(
          btnName,
          style: textStyle ?? TextFontStyle.headline16w500cFFFFFFsfPro,
        ),
      ),
    );
  }
}
