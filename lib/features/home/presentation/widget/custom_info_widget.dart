import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoRow extends StatelessWidget {
  final String iconPath;
  final String text;
  final TextStyle? textStyle;
  final double iconSize;
  final double spacing;
  final VoidCallback onTap;

  const InfoRow({
    super.key,
    required this.iconPath,
    required this.text,
    this.textStyle,
    this.iconSize = 24,
    this.spacing = 12, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap:onTap ,
      child: Row(
        spacing: spacing.w,
        children: [
          SvgPicture.asset(
            iconPath,
            width: iconSize.w,
          ),
          Expanded(
            child: Text(
              text,
              style: textStyle,
            ),
          )
        ],
      ),
    );
  }
}
