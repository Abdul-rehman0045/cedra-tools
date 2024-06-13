// ignore_for_file: must_be_immutable

import 'package:cedratools/helper/assets.dart';
import 'package:cedratools/helper/colors.dart';
import 'package:cedratools/helper/hide_keypad_on_outside_tap.dart';
import 'package:cedratools/widgets/custom_elevated_button.dart';
import 'package:cedratools/widgets/custom_text_from_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ForgetPasswordView extends StatefulWidget {
  ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  @override
  Widget build(BuildContext context) {
    return HideKeyPadOnOutsideTap(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 36.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Forgot password?",
                  style: TextStyle(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 58.h,
                ),
                CustomTextFromField(
                  hintText: "Enter your email address",
                  prefixIcon: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(Assets.mailIcon),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                RichText(
                  text: TextSpan(
                    text: "*",
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.red,
                    ),
                    children: [
                      TextSpan(
                        text: " We will send you a message to set or reset your new password",
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: kTextFieldHint,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
                CustomElevatedButton(
                  text: "Submit",
                  backgroundColor: kPrimaryColor,
                  height: 45.w,
                  width: double.infinity,
                        onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
