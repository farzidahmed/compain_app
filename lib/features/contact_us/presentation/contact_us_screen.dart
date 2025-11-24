import 'dart:developer';

import 'package:bnp_app/constants/color.dart';
import 'package:bnp_app/constants/text_font_style.dart';
import 'package:bnp_app/gen/assets.gen.dart';
import 'package:bnp_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_utils/src/extensions/export.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  void openYoutube() async {
    final Uri url = Uri.parse(
      "https://youtu.be/cvRFKSRXW7o?si=7th_hRYP4fa3v239",
    );

    await launchUrl(url, mode: LaunchMode.externalApplication);
  }

  final number = "01904383963";
  final uri = Uri(scheme: 'tel', path: "01904383963");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.cF9FAFB,

      appBar: AppBar(
        backgroundColor: AppColor.cF9FAFB,

        title: Text(
          "Contact Us".tr,
          style: TextFontStyle.headline16w400c3D4040mina,
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            UIHelper.verticalSpace(24.h),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20.sp),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: AppColor.cE2E5F0),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x142C3E50),
                    blurRadius: 4,
                    offset: Offset(0, 1),
                    spreadRadius: 0,
                  ),
                ],
                color: AppColor.cFFFFFF,
              ),
              child: Center(
                child: Text(
                  "Contact Us".tr,
                  style: TextFontStyle.headline20w400c3D4040mina,
                ),
              ),
            ),
            UIHelper.verticalSpace(24.h),
            CustomContactWidget(
              phoneTap: () {
                final uri = Uri(scheme: 'tel', path: "01904383963");
                launchUrl(uri);
                log("098493029328");
                launchUrl(uri);
              },
              emailTap: () {
                // final emailUri = Uri(
                //   scheme: 'mailto',
                //   path: 'milton.dhaka15@gmail.com',
                //   query: 'subject=Hello&body=This is a test mail',
                // );
                launchUrl(Uri.parse("mailto:milton.dhaka15@gmail.com"));
                // launchUrl(emailUri);
              },
              webTap: () {
                launchUrl(Uri.parse("https://miltondhaka15.com/"));
              },
            ),

            UIHelper.verticalSpace(30.w),

            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20.sp),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: AppColor.cE2E5F0),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x142C3E50),
                    blurRadius: 4,
                    offset: Offset(0, 1),
                    spreadRadius: 0,
                  ),
                ],
                color: AppColor.cFFFFFF,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Column(
                  spacing: 16.h,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomIconWidget(
                          icon: Assets.icons.facebook,
                          onTap: () {
                            launchUrl(
                              Uri.parse(
                                "https://www.facebook.com/share/1CxN42KGwA/",
                              ),
                            );
                          },
                        ),
                        CustomIconWidget(
                          icon: Assets.icons.whatsapp,
                          onTap: () {
                            launchUrl(
                              Uri.parse("https://wa.me/+880 1904 383963"),
                            );
                          },
                        ),
                        CustomIconWidget(
                          icon: Assets.icons.youtube,
                          onTap: () {
                            openYoutube();
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomIconWidget(
                          icon: Assets.icons.instra,
                          onTap: () {},
                        ),
                        CustomIconWidget(
                          icon: Assets.icons.twiter,
                          onTap: () {},
                        ),
                        CustomIconWidget(
                          icon: Assets.icons.web,
                          onTap: () {
                            launchUrl(Uri.parse("https://miltondhaka15.com/"));
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomIconWidget extends StatelessWidget {
  final String icon;
  final VoidCallback onTap;
  const CustomIconWidget({super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10.sp),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: AppColor.cE2E5F0),
          boxShadow: [
            BoxShadow(
              color: Color(0x142C3E50),
              blurRadius: 4,
              offset: Offset(0, 1),
              spreadRadius: 0,
            ),
          ],
          color: AppColor.cFFFFFF,
        ),
        child: SvgPicture.asset(icon, width: 24.w),
      ),
    );
  }
}

class CustomContactWidget extends StatelessWidget {
  final VoidCallback phoneTap;
  final VoidCallback emailTap;
  final VoidCallback webTap;
  const CustomContactWidget({
    super.key,
    required this.phoneTap,
    required this.emailTap,
    required this.webTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.sp),
      decoration: BoxDecoration(
        color: AppColor.cFFFFFF,
        borderRadius: BorderRadius.circular(14.r),
        boxShadow: [
          BoxShadow(
            color: Color(0x142C3E50),
            blurRadius: 4,
            offset: Offset(0, 1),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Contact Information".tr,
            style: TextFontStyle.headline20w400c3D4040mina,
          ),
          UIHelper.verticalSpace(16.h),
          Row(
            spacing: 16.w,
            children: [
              Image.asset(Assets.images.milton.path, width: 32.h, height: 32.h),

              Text(
                "Safiqul Khan Islam Milton".tr,
                style: TextFontStyle.headline14w400c3D4040mina,
              ),
            ],
          ),
          UIHelper.verticalSpace(12.h),

          Row(
            spacing: 16.w,
            children: [
              GestureDetector(
                onTap: emailTap,
                child: Text(
                  "milton.dhaka15@gmail.com".tr,
                  style: TextFontStyle.headline14w400c3D4040mina,
                ),
              ),
            ],
          ),
          UIHelper.verticalSpace(12.h),

          Row(
            spacing: 16.w,
            children: [
              //  Image.asset(Assets.images.milton.path,width: 32.h,height: 32.h,),
              GestureDetector(
                onTap: phoneTap,
                child: Text(
                  "01904383963".tr,
                  style: TextFontStyle.headline14w400c3D4040mina,
                ),
              ),
            ],
          ),
          UIHelper.verticalSpace(12.h),
          Row(
            spacing: 16.w,
            children: [
              // Image.asset(Assets.images.milton.path,width: 32.h,height: 32.h,),
              Text(
                "Dhaka,Bangladesh".tr,
                style: TextFontStyle.headline14w400c3D4040mina,
              ),
            ],
          ),
          UIHelper.verticalSpace(12.h),
          Row(
            spacing: 16.w,
            children: [
              // Image.asset(Assets.images.milton.path,width: 32.h,height: 32.h,),
              GestureDetector(
                onTap: webTap,
                child: Text(
                  "Web link".tr,
                  style: TextFontStyle.headline14w400c3D4040mina,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
