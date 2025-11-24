import 'package:bnp_app/common/custom_button.dart';
import 'package:bnp_app/common/custom_form_field.dart';
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

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final _emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.cF9FAFB,
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColor.c1A1A1A),
        title: Center(
          child: Text(
            "Enter Your Email".tr,
            style: TextFontStyle.headline32w600CFFFFFFsfPro,
          ),
        ),
      ),
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

                UIHelper.verticalSpace(80.h),
                CustomFormField(
                  style: TextFontStyle.headline16w400c52595FsfPro.copyWith(
                    color: AppColor.c1A1A1A,
                  ),
                  controller: _emailController,
                  fillColor: AppColor.cFFFFFF,
                  hintText: "Email address".tr,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email is required'.tr;
                    } else if (!RegExp(
                      r'^[^@]+@[^@]+\.[^@]+',
                    ).hasMatch(value)) {
                      return "The email address you entered isn't connected to an account.".tr;
                    }
                    return null;
                  },
                ),
                UIHelper.verticalSpace(8.h),
                Text(
                  "We’ll send you a code to confirm your email".tr,
                  style: TextFontStyle.headline14w400c3D4040sfPro,
                ),

                UIHelper.verticalSpace(104.h),
                CustomButton(
                  onTap: () {
                    forgetPassRx
                        .forgetPass(email: _emailController.text)
                        .waitingForSucess()
                        .then((success) {
                          if (success) {
                            NavigationService.navigateToWithArgs(
                              Routes.otpVerifyScreen,
                              {'email': _emailController.text},
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
