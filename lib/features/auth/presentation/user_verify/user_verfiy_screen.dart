
import 'package:bnp_app/common/custom_button.dart';
import 'package:bnp_app/constants/color.dart';
import 'package:bnp_app/constants/text_font_style.dart';
import 'package:bnp_app/helpers/all_routes.dart';
import 'package:bnp_app/helpers/loading_helper.dart';
import 'package:bnp_app/helpers/navigation_service.dart';
import 'package:bnp_app/helpers/ui_helpers.dart';
import 'package:bnp_app/networks/api_access.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/utils.dart';
import 'package:pinput/pinput.dart';

class UserVerifyScreen extends StatefulWidget {
  final String email;
  const UserVerifyScreen({super.key, required this.email});

  @override
  State<UserVerifyScreen> createState() => _UserVerifyScreenState();
}

class _UserVerifyScreenState extends State<UserVerifyScreen> {
  final _otpverifyController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _otpverifyController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.cF9FAFB,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                UIHelper.verticalSpace(24.h),

                Center(
                  child: Text(
                    "Enter Your Email".tr,
                    style: TextFontStyle.headline32w600CFFFFFFsfPro,
                  ),
                ),
                UIHelper.verticalSpace(80.h),
                Pinput(
                  isCursorAnimationEnabled: true,
                  controller: _otpverifyController,
                  separatorBuilder: (index) => SizedBox(width: 10.w),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter your 8 digit otp code".tr;
                    }
                    return null;
                  },
                  length: 6,
                  mainAxisAlignment: MainAxisAlignment.center,
                  hapticFeedbackType: HapticFeedbackType.lightImpact,
                  onCompleted: (pin) {
                    debugPrint('onCompleted: $pin');
                  },
                  onChanged: (value) {
                    debugPrint('onChanged: $value');
                  },
                  cursor: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        alignment: Alignment.bottomCenter,
                        margin: EdgeInsets.only(bottom: 20.h),
                        width: 16.w,
                        height: 2.h,
                        color: AppColor.cFFFFFF,
                      ),
                    ],
                  ),
                  defaultPinTheme: PinTheme(
                    width: 47.w,
                    height: 56.h,
                    textStyle: TextStyle(
                      fontSize: 24.sp,
                      color: AppColor.c52595F,
                    ),
                    decoration: BoxDecoration(
                      color: AppColor.cFFFFFF,
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(color: AppColor.cFFFFFF, width: 1.w),
                    ),
                  ),
                  focusedPinTheme: PinTheme(
                    width: 47.w,
                    height: 56.h,
                    textStyle: TextStyle(
                      fontSize: 24.sp,
                      color: AppColor.c52595F,
                    ),
                    decoration: BoxDecoration(
                      color: AppColor.cFFFFFF,
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(color: AppColor.cC4CDD5, width: 1.w),
                    ),
                  ),
                  submittedPinTheme: PinTheme(
                    width: 47.w,
                    height: 56.h,
                    textStyle: TextStyle(
                      fontSize: 24.sp,
                      color: AppColor.c52595F,
                    ),
                    decoration: BoxDecoration(
                      color: AppColor.cFFFFFF,
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(color: AppColor.cC4CDD5, width: 1.w),
                    ),
                  ),

                  errorPinTheme: PinTheme(
                    width: 47.w,
                    height: 56.h,
                    textStyle: TextStyle(fontSize: 24.sp, color: Colors.red),
                    decoration: BoxDecoration(
                      color: AppColor.cFFFFFF,
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(color: Colors.red, width: 1.w),
                    ),
                  ),
                ),
                UIHelper.verticalSpace(8.h),
                Text(
                  "We’ll send you a code to confirm your email".tr,
                  style: TextFontStyle.headline14w400c3D4040sfPro,
                ),

                UIHelper.verticalSpace(104.h),
                CustomButton(
                  onTap: () {
                    verifyOtpRx.userVerifyOtp(email: widget.email, otp: _otpverifyController.text).waitingForSucess().then((success){
                      if(success){
NavigationService.navigateToReplacementUntil(
                      Routes.confirmScreen,
                    );
                      }
                    });
                    
                  },
                  btnName: "Next".tr,
                  borderRadius: 100.r,
                ),
                UIHelper.verticalSpace(16.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
