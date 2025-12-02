import 'package:bnp_app/constants/color.dart';
import 'package:bnp_app/constants/text_font_style.dart';
import 'package:bnp_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyListScreen extends StatefulWidget {
  const MyListScreen({super.key});

  @override
  State<MyListScreen> createState() => _MyListScreenState();
}

class _MyListScreenState extends State<MyListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.cB1DAE0,
      appBar: AppBar(
        backgroundColor: AppColor.cB1DAE0,
        title: Text(
          "যোগাযোগ করুন ",
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
                  "যোগাযোগ করুন ",
                  style: TextFontStyle.headline20w400c3D4040mina,
                ),
              ),
            ),
            UIHelper.verticalSpace(24.h),
            Container(
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
                    "সংবিধান ও রাষ্ট্র ব্যবস্থার গণতান্ত্রিক সংস্কার এবং অর্থনৈতিক মুক্তির লক্ষ্যে রাষ্ট্র মেরামতে ৩১ দফা ঘোষণা করেছে বিএনপি।বৃহস্পতিবার দুপুরে বিএনপির চেয়ারপারসনের গুলশান রাজনৈতিক কার্যালয়ে এক সংবাদ সম্মেলনে এসব দফা ঘোষণা করেন দলটির মহাসচিব মির্জা ফখরুল ইসলাম আলমগীর। মির্জা ফখরুল বলেন, বাংলাদেশের জনগণ গণতন্ত্র, সাম্য, মানবিক মর্যাদা, সামাজিক ন্যায়বিচার প্রতিষ্ঠার স্বপ্ন নিয়ে এক সাগর রক্তের বিনিময়ে মহান মুক্তিযুদ্ধের মাধ্যমে যে রাষ্ট্র গড়ে তুলেছিল, সেই রাষ্ট্রের মালিকানা আজ তাদের হাতে নেই। বর্তমান কর্তৃত্ববাদী সরকার বাংলাদেশ রাষ্ট্র কাঠামোকে ভেঙে চুরমার করে দিয়েছে। এই রাষ্ট্র মেরামত ও পুনর্গঠন করতে হবে। দেশের জনগণের হাতেই দেশের মালিকানা ফিরিয়ে দিতে হবে। এ লক্ষ্যে একটি অবাধ, সুষ্ঠু, নিরপেক্ষ, গ্রহণযোগ্য ও অংশগ্রহণমূলক নির্বাচনের মাধ্যমে জয়লাভের পর বর্তমান ফ্যাসিস্ট সরকার হঠানোর আন্দোলনে অংশগ্রহণকারী রাজনৈতিক দলগুলোর সমন্বয়ে একটি ‘জনকল্যাণমূলক জাতীয় ঐকমত্যের সরকার’ প্রতিষ্ঠা করা হইবে।তিনি বলেন, গত এক দশকের অধিককালব্যাপী আওয়ামী লীগ সরকার ক্ষমতা কুক্ষিগত করে রাখার হীন উদ্দেশ্যে অনেক অযৌক্তিক মৌলিক সাংবিধানিক সংশোধনী এনেছে। একটি ‘সংবিধান সংস্কার কমিশন’ গঠন করে বিতর্কিত ও অগণতান্ত্রিক সাংবিধানিক সংশোধনী ও পরিবর্তন পর্যালোচনা করে রহিত/সংশোধন করা হবে এবং অন্যান্য অত্যাবশ্যকীয় সাংবিধানিক সংস্কার করা হবে। সংবিধানে গণভোট ব্যবস্থা পুনঃপ্রবর্তন করে জনগণের গণতান্ত্রিক অধিকার পুনঃপ্রতিষ্ঠা করা হবে।",
                    style: TextFontStyle.headline20w400c3D4040mina,
                  ),
                  UIHelper.verticalSpace(16.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
