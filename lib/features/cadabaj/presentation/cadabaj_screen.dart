import 'dart:io';

import 'package:bnp_app/common/custom_button.dart';
import 'package:bnp_app/common/custom_drop_down.dart';
import 'package:bnp_app/common/custom_form_field.dart';
import 'package:bnp_app/common/image_picker.dart';
import 'package:bnp_app/constants/color.dart';
import 'package:bnp_app/constants/text_font_style.dart';
import 'package:bnp_app/helpers/loading_helper.dart';
import 'package:bnp_app/helpers/navigation_service.dart';
import 'package:bnp_app/helpers/toast.dart';
import 'package:bnp_app/helpers/ui_helpers.dart';
import 'package:bnp_app/networks/api_access.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CadabajScreen extends StatefulWidget {
  const CadabajScreen({super.key});

  @override
  State<CadabajScreen> createState() => _CadabajScreenState();
}

class _CadabajScreenState extends State<CadabajScreen> {
  /// Controllers
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final complainController = TextEditingController();

  /// Image
  final ValueNotifier<XFile?> mainImage = ValueNotifier<XFile?>(null);

  /// Dropdown data
  List<String> policeStations = [];
  List<String> words = [];

  /// Selected values
  String? selectedStation;
  String? selectedWord;

  /// Loading state
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadPoliceStations();
  }

  int banglaToEnglishNumber(String banglaNumber) {
    const banglaDigits = ['০', '১', '২', '৩', '৪', '৫', '৬', '৭', '৮', '৯'];
    int result = 0;
    for (int i = 0; i < banglaNumber.length; i++) {
      int index = banglaDigits.indexOf(banglaNumber[i]);
      if (index == -1) continue;
      result = result * 10 + index;
    }
    return result;
  }

  /// ---------------- LOAD DATA ----------------
  Future<void> _loadPoliceStations() async {
    setState(() => isLoading = true);

    final success = await getAreaRx.getArear();
    if (success) {
      final data = getAreaRx.dataFetcher.valueOrNull;
      policeStations = data?.polishStation ?? [];
    }

    setState(() => isLoading = false);
  }

  Future<void> _loadWords() async {
    if (selectedStation == null) return;

    setState(() => isLoading = true);

    final success = await getWordRx.getWord(policeStation: selectedStation!);
    if (success) {
      final data = getWordRx.dataFetcher.valueOrNull;
      words = data?.words ?? [];
    }

    setState(() => isLoading = false);
  }

  /// ---------------- DISPOSE ----------------
  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    complainController.dispose();
    mainImage.dispose();
    super.dispose();
  }

  /// ---------------- BUILD ----------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.cF9FAFB,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            UIHelper.verticalSpace(24.h),
            _buildHeaderCard(),
            UIHelper.verticalSpace(24.h),
            _buildFormContainer(),
          ],
        ),
      ),
    );
  }

  /// ---------------- COMPONENTS ----------------
  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: AppColor.cF9FAFB,
      title: Text(
        'Report extortionists and drug dealers.'.tr,
        style: TextFontStyle.headline16w400c3D4040mina,
      ),
    );
  }

  Widget _buildHeaderCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.sp),
      decoration: BoxDecoration(
        color: AppColor.cFFFFFF,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColor.cE2E5F0),
        boxShadow: [
          BoxShadow(
            color: Color(0x142C3E50),
            blurRadius: 4,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Center(
        child: Text(
          'Report information about extortionists and drug dealers.'.tr,
          style: TextFontStyle.headline20w400c3D4040mina,
        ),
      ),
    );
  }

  Widget _buildFormContainer() {
    return Container(
      padding: EdgeInsets.all(24.sp),
      decoration: BoxDecoration(
        color: AppColor.primaryCOlor,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Column(
        children: [
          _buildTextField(nameController, "Enter your name".tr),
          UIHelper.verticalSpace(20.h),
          _buildTextField(phoneController, "Enter your phone number".tr),
          UIHelper.verticalSpace(20.h),
          if (!isLoading)
            _buildDropdown(
              hint: 'Select Police Station'.tr,
              value: selectedStation,
              items: policeStations,
              onChanged: (value) {
                setState(() {
                  selectedStation = value;
                  selectedWord = null;
                });
                _loadWords();
              },
            ),
          UIHelper.verticalSpace(20.h),
          if (!isLoading)
            _buildDropdown(
              hint: 'Select Word'.tr,
              value: selectedWord,
              items: words,
              onChanged: (value) => setState(() => selectedWord = value),
            ),
          UIHelper.verticalSpace(20.h),
          _buildTextField(
            complainController,
            "Enter your complaint".tr,
            maxLines: 3,
          ),
          UIHelper.verticalSpace(20.h),
          _buildImagePicker(),
          UIHelper.verticalSpace(24.h),
          _buildSubmitButton(),
          UIHelper.verticalSpace(30.h),
        ],
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String hint, {
    int maxLines = 1,
  }) {
    return CustomFormField(
      controller: controller,
      hintText: hint,
      maxline: maxLines,
      hintsTextAStyle: TextFontStyle.headline16w400c3D4040mina.copyWith(
        color: AppColor.cFFFFFF,
      ),
    );
  }

  Widget _buildDropdown({
    required String hint,
    required String? value,
    required List<String> items,
    required Function(String?) onChanged,
  }) {
    return CustomDropdown(
      selectedValue: value,
      hintText: hint,
      items: items,
      onChanged: onChanged,
      isBorder: false,
      backgroundColor: Colors.transparent,
      dropDownColor: AppColor.primaryCOlor,
    );
  }

  Widget _buildImagePicker() {
    return ValueListenableBuilder<XFile?>(
      valueListenable: mainImage,
      builder: (context, value, _) {
        return InkWell(
          onTap: () => showPickImageBottomSheet(context, mainImage),
          child: value == null
              ? _buildImagePlaceholder()
              : Image.file(
                  File(value.path),
                  width: double.infinity,
                  height: 100.h,
                  fit: BoxFit.cover,
                ),
        );
      },
    );
  }

  Widget _buildImagePlaceholder() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 32.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColor.cE2E5F0),
        color: AppColor.cFFFFFF,
      ),
      child: Container(
        padding: EdgeInsets.all(20.sp),
        decoration: BoxDecoration(
          border: Border.all(color: AppColor.c1A1A1A),
          borderRadius: BorderRadius.circular(14.r),
        ),
        child: Center(
          child: Text(
            "Provide a picture (if any)".tr,
            style: TextFontStyle.headline12w400c3D4040mina,
          ),
        ),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return CustomButton(
      bgColor: AppColor.cFFFFFF,
      textStyle: TextFontStyle.headline14w400c3D4040mina,
      btnName: "Write your complaint".tr,
      onTap: () {
        int wordNumber = banglaToEnglishNumber(selectedWord ?? "০");

        drugSellerRx
            .drugSeller(
              complainSuggetion: complainController.text,
              name: nameController.text,
              phone: phoneController.text,
              policeStation: selectedStation ?? "",
              word: wordNumber.toString(),
              image: mainImage.value != null
                  ? File(mainImage.value!.path)
                  : null,
            )
            .waitingForSucess()
            .then((success) {
              if (success) {
                ToastUtil.showLongToast("Complain submitted".tr);
                NavigationService.goBack;
              }
            });
      },
    );
  }
}
