import 'package:bnp_app/constants/color.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropdown extends StatelessWidget {
  final String hintText;
  final List<String> items;
  final String? selectedValue;
  final Function(String?) onChanged;
  final Color? backgroundColor;
  final bool isBorder;
  final Color? dropDownColor;
  final Color? borderColor;

  const CustomDropdown({
    super.key,
    required this.hintText,
    required this.items,
    this.selectedValue,
    required this.onChanged,
    this.backgroundColor,
    required this.isBorder,
    this.dropDownColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      //  padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.transparent,
        borderRadius: BorderRadius.circular(4.r),
        border: Border.all(color: AppColor.cFFFFFF),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          isExpanded: true,
          value: selectedValue,
          hint: Text(
            hintText,
            style: TextStyle(
              color: AppColor.cFFFFFF,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ),

          dropdownStyleData: DropdownStyleData(
            maxHeight: 200.h,
            decoration: BoxDecoration(
              color: dropDownColor ?? const Color(0xFF121417),
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
          menuItemStyleData: MenuItemStyleData(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
          ),
          items:
              items
                  .map(
                    (item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColor.cFFFFFF,
                        ),
                      ),
                    ),
                  )
                  .toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}