import 'package:bnp_app/common/custom_button.dart';
import 'package:bnp_app/common/custom_form_field.dart';
import 'package:bnp_app/constants/color.dart';
import 'package:bnp_app/constants/text_font_style.dart';
import 'package:bnp_app/gen/assets.gen.dart';
import 'package:bnp_app/helpers/all_routes.dart';
import 'package:bnp_app/helpers/loading_helper.dart';
import 'package:bnp_app/helpers/navigation_service.dart';
import 'package:bnp_app/helpers/toast.dart';
import 'package:bnp_app/helpers/ui_helpers.dart';
import 'package:bnp_app/networks/api_access.dart';
import 'package:bnp_app/providers/reset_pass_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class ResetPasswordScreen extends StatefulWidget {
  final String email;
  final String token;
  const ResetPasswordScreen({
    super.key,
    required this.email,
    required this.token,
  });

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _confirmPassword = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _confirmPassword.dispose();
    _passwordController.dispose();
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
                    "Enter New Password",
                    style: TextFontStyle.headline32w600CFFFFFFsfPro,
                  ),
                ),
                UIHelper.verticalSpace(80.h),

                Consumer<ResetPassProvider>(
                  builder: (context, provider, child) {
                    return CustomFormField(
                      style: TextFontStyle.headline16w400c52595FsfPro.copyWith(
                        color: AppColor.c1A1A1A,
                      ),
                      controller: _passwordController,
                      isPass: true,
                      isObsecure: provider.resetPass,
                      fillColor: AppColor.cFFFFFF,
                      hintText: "Password",
                      textInputAction: TextInputAction.done,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          provider.toggleResetPassword();
                        },
                        child: Padding(
                          padding: EdgeInsets.all(12.sp),
                          child: SvgPicture.asset(
                            provider.resetPass
                                ? Assets.icons.eyeClose
                                : Assets.icons.eyeClose,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password is required';
                        } else if (value.length < 8) {
                          return 'Password must be at least 8 characters';
                        }
                        return null;
                      },
                    );
                  },
                ),
                UIHelper.verticalSpace(12.h),
                Consumer<ResetPassProvider>(
                  builder: (context, provider, child) {
                    return CustomFormField(
                      style: TextFontStyle.headline16w400c52595FsfPro.copyWith(
                        color: AppColor.c1A1A1A,
                      ),
                      controller: _confirmPassword,
                      isPass: true,
                      isObsecure: provider.resetConfirmPass,
                      fillColor: AppColor.cFFFFFF,
                      hintText: "Confirm Password",
                      textInputAction: TextInputAction.done,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          provider.toggleResetConfirm();
                        },
                        child: Padding(
                          padding: EdgeInsets.all(12.sp),
                          child: SvgPicture.asset(
                            provider.resetConfirmPass
                                ? Assets.icons.eyeClose
                                : Assets.icons.eyeClose,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password is required';
                        } else if (value.length < 8) {
                          return 'Password must be at least 8 characters';
                        } else if (value != _passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    );
                  },
                ),
                UIHelper.verticalSpace(68.h),

                CustomButton(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      resetPasswordRx
                          .resetPassword(
                            email: widget.email,
                            token: widget.token,
                            password: _passwordController.text,
                            confirmPassword: _confirmPassword.text,
                          )
                          .waitingForSucess()
                          .then((success) {
                            if (success) {
                              ToastUtil.showLongToast(
                                "Password Reset succesfully",
                              );
                              NavigationService.navigateToReplacementUntil(
                                Routes.loginScreen,
                              );
                            }
                          });
                    }
                  },
                  btnName: "Continue",
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
