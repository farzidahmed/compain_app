import 'dart:developer';

import 'package:bnp_app/constants/app_constants.dart';
import 'package:bnp_app/constants/color.dart';
import 'package:bnp_app/constants/text_font_style.dart';
import 'package:bnp_app/features/home/presentation/widget/custom_carsoul_sileder.dart';
import 'package:bnp_app/features/home/presentation/widget/custom_drawer_widget.dart';
import 'package:bnp_app/gen/assets.gen.dart';
import 'package:bnp_app/helpers/all_routes.dart';
import 'package:bnp_app/helpers/helpers_method.dart';
import 'package:bnp_app/helpers/navigation_service.dart';
import 'package:bnp_app/helpers/ui_helpers.dart';
import 'package:bnp_app/networks/api_access.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final box = GetStorage();
  String selectedLanguage = 'ENGLISH';

  final List<Map<String, dynamic>> items = [
    {
      "title": "Submit your complaints and suggestions.",
      "img": Assets.icons.info,
      "route": Routes.information,
    },
    {
      "title": "Provide information to extortionists and drug dealers",
      "img": Assets.icons.moneyExchange,
      "route": Routes.cadabaj,
    },
    {
      "title": "BNP's 31 points",
      "img": Assets.icons.bnpAlbum,
      "route": Routes.bnpDofa,
    },
    {"title": "Gallery", "img": Assets.icons.albums2, "route": Routes.gallery},
    {
      "title": "Contact us",
      "img": Assets.icons.contact,
      "route": Routes.contactUs,
    },
    {
      "title": "About me",
      "img": Assets.icons.about,
      "route": Routes.aboutUsScreen,
    },
  ];

  // Language map
  final Map<String, String> langCodeMap = {'ENGLISH': 'en', 'BANGLA': 'bd'};

  @override
  void initState() {
    super.initState();

    /// API calls
    getGalleryRx.getGallery();
    getCarasoulRx.getCarasul();
    getProgrameRx.getProgramme();
    getAreaRx.getArear();
    //getWordRx.getWord(policeStation:getAreaRx. )

    /// Load saved language
    String savedLang = box.read(kKeyLanguage) ?? 'bd';

    selectedLanguage = _getLangName(savedLang);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.updateLocale(Locale(savedLang));
    });
  }

  // Convert code → language label
  String _getLangName(String code) {
    switch (code) {
      case 'bd':
        return 'BANGLA';
      default:
        return 'ENGLISH';
    }
  }

  // Build Language Popup
  Future<String?> _showLanguagePopup(BuildContext context) {
    return showMenu<String>(
      color: AppColor.cFFFFFF,
      context: context,
      position: const RelativeRect.fromLTRB(10, 10, 0, 0),
      items: [
        PopupMenuItem(value: 'ENGLISH', child: Text('English')),
        PopupMenuItem(value: 'BANGLA', child: Text('Bangla')),
      ],
    );
  }

  void _onLanguageSelected(String value) {
    setState(() => selectedLanguage = value);

    String langCode = langCodeMap[value] ?? 'en';
    box.write(kKeyLanguage, langCode);

    Get.updateLocale(Locale(langCode));

    log("Language updated: $langCode");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.cF9FAFB,
      drawer: Drawer(child: CustomDrawerWidget()),
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  // --- UI BUILDERS -------------------------------------------------------

  AppBar _buildAppBar() {
    return AppBar(
      title: Row(
        spacing: 12.w,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                showNameDialog(
                  context: context,
                  titile: "Safiqul Khan Islam Milton".tr,
                );
              },
              child: Text(
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                "Safiqul Khan Islam Milton".tr,
                style: TextFontStyle.headline18w600c1A1A1AsfPro,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              _showLanguagePopup(context).then((value) {
                if (value != null) _onLanguageSelected(value);
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: AppColor.cE2E5F0),
                color: AppColor.cFFFFFF,
                boxShadow: [
                  BoxShadow(
                    color: Color(0x142C3E50),
                    blurRadius: 4,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Icon(Icons.language, color: AppColor.c1A1A1A),
                  SizedBox(width: 6.w),
                  Text(
                    selectedLanguage == 'BANGLA' ? "বাংলা" : "ENG",
                    style: TextFontStyle.headline14w400c3D4040sfPro,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF2E6895),
            Color(0xFFCBC7C1),
            // Color(0xFFB6B3AE),
            Color(0xFF6A8BB4),
          ],
        ),
      ),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            UIHelper.verticalSpace(24.h),
            _buildCarousel(),
            UIHelper.verticalSpace(24.h),
            _buildGridMenu(),
          ],
        ),
      ),
    );
  }

  // Carousel Builder
  Widget _buildCarousel() {
    return StreamBuilder(
      stream: getCarasoulRx.dataFetcher.stream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return const Center(child: Text("Failed to load images"));
        }

        final images = snapshot.data?.images ?? [];

        if (images.isEmpty) {
          return const Center(child: Text("No images available"));
        }

        return CarouselWithSmoothIndicator(
          height: 300.h,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 2),
          items: images
              .map(
                (url) => Image.network(
                  url,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              )
              .toList(),
        );
      },
    );
  }

  // Grid Menu Builder
  Widget _buildGridMenu() {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: items.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12.w,
        crossAxisSpacing: 12.h,
      ),
      itemBuilder: (context, index) {
        final item = items[index];

        return GestureDetector(
          onTap: () => NavigationService.navigateTo(item['route']),
          child: Container(
            padding: EdgeInsets.all(14.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: AppColor.cE2E5F0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color(0x142C3E50),
                  blurRadius: 4,
                  offset: Offset(0, 1),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 12.h,
              children: [
                SvgPicture.asset(item["img"], width: 40.w),
                Text(
                  item["title"].toString().tr,
                  textAlign: TextAlign.center,
                  style: TextFontStyle.headline14w400c3D4040sfPro,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
