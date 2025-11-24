import 'package:bnp_app/constants/text_font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final String email;
  final String phone;
  final Color borderColor;
  final double imageSize;

  const ProfileCard({
    super.key,
    required this.imagePath,
    required this.name,
    required this.email,
    required this.phone,
    this.borderColor = const Color(0xFF294957),
    this.imageSize = 58,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 12.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: const Color(0xFFE2E5F0)),
        boxShadow: [
          BoxShadow(
            color: const Color(0x142C3E50),
            blurRadius: 4,
            offset: const Offset(0, 1),
            spreadRadius: 0,
          ),
        ],
        color: Colors.white,
      ),
      child: Column(
        children: [
          Container(
            height: imageSize.h,
            width: imageSize.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: borderColor),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100.r),
              child: Image.asset(imagePath, fit: BoxFit.cover),
            ),
          ),
          SizedBox(height: 14.h),
          Text(
            name,
            style: TextFontStyle.headline18w600c1A1A1AsfPro,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8.h),
          Text(email, style: TextFontStyle.headline14w400c3D4040mina),
          SizedBox(height: 8.h),
          Text(phone, style: TextFontStyle.headline14w400c3D4040mina),
        ],
      ),
    );
  }
}
