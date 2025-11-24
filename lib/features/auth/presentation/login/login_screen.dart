import 'package:bnp_app/common/custom_button.dart';
import 'package:bnp_app/common/custom_form_field.dart';
import 'package:bnp_app/common/custom_white_button_widget.dart';
import 'package:bnp_app/constants/color.dart';
import 'package:bnp_app/constants/text_font_style.dart';
import 'package:bnp_app/gen/assets.gen.dart';
import 'package:bnp_app/helpers/all_routes.dart';
import 'package:bnp_app/helpers/navigation_service.dart';
import 'package:bnp_app/helpers/toast.dart';
import 'package:bnp_app/helpers/ui_helpers.dart';
import 'package:bnp_app/networks/api_access.dart';
import 'package:bnp_app/providers/auth_provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/utils.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
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
          physics: BouncingScrollPhysics(),
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
                    "Log In".tr,
                    style: TextFontStyle.headline32w600CFFFFFFsfPro,
                  ),
                ),
                UIHelper.verticalSpace(144.h),
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
                UIHelper.verticalSpace(20.h),
                Consumer<AuthProvider>(
                  builder: (context, provider, child) {
                    return CustomFormField(
                      style: TextFontStyle.headline16w400c52595FsfPro.copyWith(
                        color: AppColor.c1A1A1A,
                      ),
                      controller: _passwordController,
                      isPass: true,
                      isObsecure: provider.isPassVisible,
                      fillColor: AppColor.cFFFFFF,
                      hintText: "Password".tr,
                      textInputAction: TextInputAction.done,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          provider.togglePassword();
                        },
                        child: Padding(
                          padding: EdgeInsets.all(12.sp),
                          child: SvgPicture.asset(
                            provider.isPassVisible
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
                UIHelper.verticalSpace(16.h),
                GestureDetector(
                  onTap: () {
                    NavigationService.navigateTo(Routes.forgetPasswordScreen);
                  },
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Forget Password ?".tr,
                      style: TextFontStyle.headline16w500C9A9A9AsfPro,
                    ),
                  ),
                ),
                UIHelper.verticalSpace(140.h),
                CustomButton(
                  onTap: () {
                    loginRx
                        .login(
                          email: _emailController.text,
                          password: _passwordController.text,
                        )
                        .then((success) {
                          if (success) {
                            ToastUtil.showLongToast("Login successfully".tr);
                            NavigationService.navigateToReplacementUntil(
                              Routes.homeScreen,
                            );
                          }
                        });
                  },
                  btnName: "Log in".tr,
                  borderRadius: 100.r,
                ),
                UIHelper.verticalSpace(16.h),

                CustomWhiteButtonWIdget(onTap: () {}),

                UIHelper.verticalSpace(60.h),
                Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: "Don’t have an account? ".tr,
                      style: TextFontStyle.headline16w400c52595FsfPro.copyWith(
                        color: AppColor.c6C757D,
                      ),
                      children: [
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              NavigationService.navigateTo(Routes.signupScreen);
                            },
                          text: "  Sign up".tr,
                          style: TextFontStyle.headline16w500C9A9A9AsfPro
                              .copyWith(color: AppColor.c60AEE1),
                        ),
                      ],
                    ),
                  ),
                ),

                //Text("")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
