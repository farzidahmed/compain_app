import 'package:bnp_app/constants/text_font_style.dart';
import 'package:bnp_app/features/home/presentation/widget/custom_info_widget.dart';
import 'package:bnp_app/features/home/presentation/widget/custom_profile_card.dart';
import 'package:bnp_app/gen/assets.gen.dart';
import 'package:bnp_app/helpers/all_routes.dart';
import 'package:bnp_app/helpers/navigation_service.dart';
import 'package:bnp_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/export.dart';

class CustomDrawerWidget extends StatelessWidget {
  const CustomDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30.sp),
      child: Column(
        children: [
          ProfileCard(
            imagePath: Assets.images.milton.path,
            name: "Safiqul Islam Khan Milton".tr,
            email: "milton.dhaka15@gmail.com".tr,
            phone: "01904383963".tr,
          ),
          UIHelper.verticalSpace(24.h),
          InfoRow(
            iconPath: Assets.icons.info,
            text: "Submit your complaints and suggestions.".tr,
            textStyle: TextFontStyle.headline14w400c3D4040sfPro,
            onTap: () {
              NavigationService.navigateTo(Routes.information);
            },
          ),
          UIHelper.verticalSpace(24.h),
          InfoRow(
            iconPath: Assets.icons.moneyExchange,
            text: "Provide information to extortionists and drug dealers".tr,
            textStyle: TextFontStyle.headline14w400c3D4040sfPro,
            onTap: () {
              NavigationService.navigateTo(Routes.cadabaj);
            },
          ),
          UIHelper.verticalSpace(24.h),

          InfoRow(
            iconPath: Assets.icons.bnpAlbum,
            text: "BNP's 31 points".tr,
            textStyle: TextFontStyle.headline14w400c3D4040sfPro,
            onTap: () {
              NavigationService.navigateTo(Routes.bnpDofa);
            },
          ),
          UIHelper.verticalSpace(24.h),

          InfoRow(
            iconPath: Assets.icons.albums2,
            text: "Gallery".tr,
            textStyle: TextFontStyle.headline14w400c3D4040sfPro,
            onTap: () {
              NavigationService.navigateTo(Routes.gallery);
            },
          ),
          UIHelper.verticalSpace(24.h),

          InfoRow(
            iconPath: Assets.icons.contact,
            text: "Contact us".tr,
            textStyle: TextFontStyle.headline14w400c3D4040sfPro,
            onTap: () {
              NavigationService.navigateTo(Routes.contactUs);
            },
          ),
          UIHelper.verticalSpace(24.h),

          InfoRow(
            iconPath: Assets.icons.about,
            text: "About me".tr,
            textStyle: TextFontStyle.headline14w400c3D4040sfPro,
            onTap: () {
              NavigationService.navigateTo(Routes.aboutUsScreen);
            },
          ),
          UIHelper.verticalSpace(36.h),

          // InfoRow(
          //   iconPath: Assets.icons.logout,
          //   text: "Logout".tr,
          //   textStyle: TextFontStyle.headline14w400c3D4040sfPro,
          //   onTap: () {
          //     //NavigationService.navigateTo(Routes.aboutUsScreen);
          //     showCustomDialog(
          //       context: context,
          //       titile: 'LogOut'.tr,
          //       subTitile: 'Are you sure you want to log out account?'.tr,
          //       confirmButtonName: 'Yes, Log out'.tr,
          //       cancleButtonName: 'No'.tr,
          //       img: '',
          //       yesTap: () {
          //         logoutRX.logOut().waitingForSucess().then((success) {
          //           if (success) {
          //             ToastUtil.showLongToast("Log out successfully");
          //             NavigationService.navigateToReplacementUntil(
          //               Routes.loginScreen,
          //             );
          //           }
          //         });
          //       },
          //       noTap: () {
          //         NavigationService.goBack;
          //       },
          //     );
          //   },
          // ),
        ],
      ),
    );
  }
}
