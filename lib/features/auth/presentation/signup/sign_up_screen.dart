import 'package:bnp_app/common/custom_button.dart';
import 'package:bnp_app/common/custom_form_field.dart';
import 'package:bnp_app/constants/color.dart';
import 'package:bnp_app/constants/text_font_style.dart';
import 'package:bnp_app/gen/assets.gen.dart';
import 'package:bnp_app/helpers/all_routes.dart';
import 'package:bnp_app/helpers/loading_helper.dart';
import 'package:bnp_app/helpers/navigation_service.dart';
import 'package:bnp_app/helpers/ui_helpers.dart';
import 'package:bnp_app/networks/api_access.dart';
import 'package:bnp_app/providers/sign_up_provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/utils.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  /// Controllers
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.cF9FAFB,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UIHelper.verticalSpace(24.h),

                Center(
                  child: Text(
                    "Sign Up".tr,
                    style: TextFontStyle.headline32w600CFFFFFFsfPro,
                  ),
                ),

                UIHelper.verticalSpace(144.h),

                /// Full name
                CustomFormField(
                  style: TextFontStyle.headline16w400c52595FsfPro.copyWith(
                    color: AppColor.c1A1A1A,
                  ),
                  controller: _nameController,
                  fillColor: AppColor.cFFFFFF,
                  hintText: "Full name".tr,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Name is required'.tr;
                    }
                    return null;
                  },
                ),

                UIHelper.verticalSpace(16.h),

                /// Phone number
                CustomFormField(
                  style: TextFontStyle.headline16w400c52595FsfPro.copyWith(
                    color: AppColor.c1A1A1A,
                  ),
                  controller: _phoneController,
                  fillColor: AppColor.cFFFFFF,
                  hintText: "Phone number".tr,
                  textInputAction: TextInputAction.next,
                  //  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Phone number is required'.tr;
                    }
                    return null;
                  },
                ),

                UIHelper.verticalSpace(16.h),

                /// Email address
                CustomFormField(
                  style: TextFontStyle.headline16w400c52595FsfPro.copyWith(
                    color: AppColor.c1A1A1A,
                  ),
                  controller: _emailController,
                  fillColor: AppColor.cFFFFFF,
                  hintText: "Email address".tr,
                  textInputAction: TextInputAction.next,
                  //inputFormatters: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email is required'.tr;
                    } else if (!RegExp(
                      r'^[^@]+@[^@]+\.[^@]+',
                    ).hasMatch(value)) {
                      return "Please enter a valid email address.".tr;
                    }
                    return null;
                  },
                ),

                UIHelper.verticalSpace(20.h),

                /// Password
                Consumer<SignUpProvider>(
                  builder: (context, provider, child) {
                    return CustomFormField(
                      style: TextFontStyle.headline16w400c52595FsfPro.copyWith(
                        color: AppColor.c1A1A1A,
                      ),
                      controller: _passwordController,
                      isPass: true,
                      isObsecure: provider.newPass,
                      fillColor: AppColor.cFFFFFF,
                      hintText: "Password".tr,
                      textInputAction: TextInputAction.done,
                      suffixIcon: GestureDetector(
                        onTap: provider.toggleNewPassword,
                        child: Padding(
                          padding: EdgeInsets.all(12.sp),
                          child: SvgPicture.asset(
                            provider.newPass
                                ? Assets.icons.eyeClose
                                : Assets.icons.eyeClose,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password is required'.tr;
                        } else if (value.length < 8) {
                          return 'Password must be at least 8 characters'.tr;
                        }
                        return null;
                      },
                    );
                  },
                ),

                UIHelper.verticalSpace(80.h),

                /// Sign Up button
                CustomButton(
                  btnName: "Sign up".tr,
                  borderRadius: 100.r,
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      final name = _nameController.text.trim();
                      final phone = _phoneController.text.trim();
                      final email = _emailController.text.trim();
                      final password = _passwordController.text.trim();

                      // Example API call (adjust as needed)
                      await signupRx
                          .signup(
                            name: name,
                            email: email,
                            password: password,
                            confirmPassword: password,
                            isTermAccepted: true,
                          )
                          .waitingForSucess()
                          .then((success) {
                            if (success) {
                              NavigationService.navigateToWithArgs(
                                Routes.userVerifyScreen,
                                {'email': email},
                              );
                            }
                          });
                    }
                  },
                ),

                //  UIHelper.verticalSpace(16.h),

                /// White button (e.g. continue with Google)
                //    CustomWhiteButtonWIdget(onTap: () {}),
                UIHelper.verticalSpace(60.h),

                /// Already have an account?
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: "Already have an account?".tr,
                      style: TextFontStyle.headline16w400c52595FsfPro.copyWith(
                        color: AppColor.c6C757D,
                      ),
                      children: [
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              NavigationService.goBack();
                            },
                          text: "  Log in".tr,
                          style: TextFontStyle.headline16w400c52595FsfPro
                              .copyWith(color: AppColor.c60AEE1),
                        ),
                      ],
                    ),
                  ),
                ),

                UIHelper.verticalSpace(30.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
