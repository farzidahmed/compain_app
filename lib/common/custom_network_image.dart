import 'package:bnp_app/gen/assets.gen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomNetworkImageWidget extends StatelessWidget {
  final String urls;
  final double? width;
  final double? height;
  const CustomNetworkImageWidget({
    super.key,
    required this.urls,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      // imageUrl: "$imageUrl/$urls",
      imageUrl: urls,
      width: width ?? 90.w,
      height: height ?? 70.h,
      fit: BoxFit.cover,
      placeholder: (context, url) => Image.asset(
        Assets.images.splashBg.path,
        fit: BoxFit.fill,
      ),
      errorWidget: (context, string, url) => Image.asset(
        Assets.images.splashBg.path,
        fit: BoxFit.cover,
      ),
    );
  }
}



  //final ValueNotifier<XFile?> mainImage = ValueNotifier<XFile?>(null);
// alueListenableBuilder<XFile?>(
//                       valueListenable: mainImage,
//                       builder: (context, value, child) {
//                         return Stack(
//                           children: [
//                             Container(
//                               decoration: BoxDecoration(
//                                 border: Border.all(
//                                   color: AppColors.allPrimaryColor,
//                                   width: 2.w,
//                                 ),
//                                 shape: BoxShape.circle,
//                               ),
//                               child: Center(
//                                 child: ClipOval(
//                                   child: value == null
//                                       ? CustomNetworkImageWidget(
//                                           width: 110.h,
//                                           height: 110.h,
//                                           urls:
//                                               "https://t4.ftcdn.net/jpg/03/26/98/51/360_F_326985142_1aaKcEjMQW6ULp6oI9MYuv8lN9f8sFmj.jpg",
//                                         )
//                                       : Image.file(
//                                           File(value.path),
//                                           width: 110.h,
//                                           height: 110.h,
//                                           fit: BoxFit.cover,
//                                         ),
//                                 ),
//                               ),
//                             ),
//                             Positioned(
//                               top: 85.h,
//                               left: 190.w,
//                               child: GestureDetector(
//                                 onTap: () {
//                                   showPickImageBottomSheet(context, mainImage);
//                                 },
//                                 child: Container(
//                                   padding: EdgeInsets.all(5.56.sp),
//                                   decoration: BoxDecoration(
//                                     color: AppColors.cFFFFFF,
//                                     borderRadius: BorderRadius.circular(5.56.r),
//                                     border:
//                                         Border.all(color: AppColors.c9ADBF6),
//                                   ),
//                                   child:
//                                       SvgPicture.asset(Assets.icons.editIcon),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         );
//                       },
//                     ),