import 'package:cedratools/helper/assets.dart';
import 'package:cedratools/helper/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: kPrimaryColor,
      style: TextStyle(
        fontSize: 13.sp,
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        isDense: true,
        filled: true,
        fillColor: Colors.white,
        hintText: "Search here ...",
        hintStyle: TextStyle(
          fontSize: 13.sp,
          fontWeight: FontWeight.w400,
          color: kSearchFieldHint,
        ),
        prefixIcon: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              Assets.searchFieldIcon,
            ),
          ],
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 12.h,
          vertical: 10.h,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(
            color: kSearchFieldOutline,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(
            color: kSearchFieldOutline,
          ),
        ),
      ),
    );
  }
}
