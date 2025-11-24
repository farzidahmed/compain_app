import 'package:bnp_app/common/custom_network_image.dart';
import 'package:bnp_app/constants/color.dart';
import 'package:bnp_app/constants/text_font_style.dart';
import 'package:bnp_app/features/bnp_dofa/model/programme_image_response.dart';
import 'package:bnp_app/helpers/ui_helpers.dart';
import 'package:bnp_app/networks/api_access.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/export.dart';

class BnpDofaScreen extends StatefulWidget {
  const BnpDofaScreen({super.key});

  @override
  State<BnpDofaScreen> createState() => _BnpDofaScreenState();
}

class _BnpDofaScreenState extends State<BnpDofaScreen> {
  @override
  void initState() {
    getProgrameRx.getProgramme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.cF9FAFB,

      appBar: AppBar(
        backgroundColor: AppColor.cF9FAFB,

        title: Text(
          "BNP's 31 points".tr,
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
                  "BNP's 31 points".tr,
                  style: TextFontStyle.headline20w400c3D4040mina,
                ),
              ),
            ),
            UIHelper.verticalSpace(24.h),
            StreamBuilder(
              stream: getProgrameRx.getChatListStream,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return SizedBox.shrink();
                } else if (snapshot.hasData) {
                  GetProgrammeImageResponse response = snapshot.data;
                  return GridView.builder(
                    itemCount: response.images?.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final data = response.images?[index];
                      return Container(
                        decoration: BoxDecoration(
                          color: AppColor.cFFFFFF,
                          borderRadius: BorderRadius.circular(24.r),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x142C3E50),
                              blurRadius: 4,
                              offset: Offset(0, 1),
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadiusGeometry.circular(24.r),
                          child: CustomNetworkImageWidget(
                            width: 150.w,
                            height: 150.h,
                            urls: data ?? "",
                          ),
                        ),
                      );
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 14.h,
                      crossAxisSpacing: 14.w,
                    ),
                  );
                } else {
                  return SizedBox.shrink();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
