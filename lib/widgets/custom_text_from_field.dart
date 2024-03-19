// ignore_for_file: must_be_immutable

import 'package:cedratools/helper/assets.dart';
import 'package:cedratools/helper/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFromField extends StatelessWidget {
  CustomTextFromField({
    super.key,
    this.prefixIcon,
    required this.hintText,
    this.suffixIcon,
    this.obscureText = false,
    this.maxLines,
    this.maxLength,
  });

  Widget? prefixIcon;
  String hintText;
  Widget? suffixIcon;
  bool obscureText;
  int? maxLines;
  int? maxLength;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: kTextFieldHint,
      obscureText: obscureText,
      maxLength: maxLength,
      maxLines: maxLines,
      style: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      decoration: InputDecoration(
        isDense: true,
        filled: true,
        fillColor: kTextFieldBg.withOpacity(0.1),
        hintText: "$hintText",
        hintStyle: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: kTextFieldHint,
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 12.w,
          vertical: 18.h,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: kTextFieldBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: kTextFieldBorder),
        ),
      ),
    );
  }
}
