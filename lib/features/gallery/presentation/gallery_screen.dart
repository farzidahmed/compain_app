import 'package:bnp_app/common/custom_network_image.dart';
import 'package:bnp_app/constants/color.dart';
import 'package:bnp_app/constants/text_font_style.dart';
import 'package:bnp_app/features/gallery/model/get_gallery_response.dart';
import 'package:bnp_app/helpers/ui_helpers.dart';
import 'package:bnp_app/networks/api_access.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/export.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  @override
  void initState() {
    getGalleryRx.getGallery();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.cB1DAE0,
      appBar: AppBar(
        backgroundColor: AppColor.cB1DAE0,
        title: Text(
          "Gallery".tr,
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
                  "Gallery".tr,
                  style: TextFontStyle.headline20w400c3D4040mina,
                ),
              ),
            ),
            UIHelper.verticalSpace(24.h),
            StreamBuilder(
              stream: getGalleryRx.getChatListStream,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return SizedBox.shrink();
                } else if (snapshot.hasData) {
                  GetGalleryResponse response = snapshot.data;
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
