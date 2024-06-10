// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:cedratools/helper/assets.dart';
import 'package:cedratools/helper/colors.dart';
import 'package:cedratools/view_models/auth_view_model.dart';
import 'package:cedratools/views/complete_profile_view.dart';
import 'package:cedratools/widgets/custom_elevated_button.dart';
import 'package:cedratools/widgets/custom_text_from_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class PasswordView extends ConsumerWidget {
  PasswordView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var readRefrence = ref.read(authControllerProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Enter Your Password",
                style: TextStyle(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: SvgPicture.asset(Assets.passwordPic),
              ),
              SizedBox(
                height: 63.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 34.w),
                child: Column(
                  children: [
                    CustomTextFromField(
                      hintText: "Password",
                      controller: readRefrence.passwordEditingController,
                      obscureText: !ref.watch(authControllerProvider).isPasswordVisible,
                      maxLines: 1,
                      prefixIcon: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(Assets.lockIcon),
                        ],
                      ),
                      suffixIcon: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              readRefrence.getPasswordVisible();
                            },
                            child: ref.watch(authControllerProvider).isPasswordVisible
                                ? Icon(Icons.visibility)
                                : Icon(
                                    Icons.visibility_off,
                                  ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 31.h),
                    if (readRefrence.isPasswordSet == false) ...[
                      CustomTextFromField(
                        hintText: "Confirm Password",
                        controller: readRefrence.confirmPasswordEditingController,
                        obscureText: !ref.watch(authControllerProvider).isConfirmPasswordVisible,
                        maxLines: 1,
                        prefixIcon: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(Assets.lockIcon),
                          ],
                        ),
                        suffixIcon: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                readRefrence.getConfirmPasswordVisible();
                              },
                              child: ref.watch(authControllerProvider).isConfirmPasswordVisible
                                  ? Icon(Icons.visibility)
                                  : Icon(
                                      Icons.visibility_off,
                                    ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 31.h),
                    ],
                    CustomElevatedButton(
                      text: "Next",
                      backgroundColor: kPrimaryColor,
                      height: 45.w,
                      width: double.infinity,
                      onPressed: () {
                        if (readRefrence.isPasswordSet == true) {
                          log("--old user-->");
                          if (readRefrence.validatePassword(context)) {
                            readRefrence.login(ref: ref, context: context);
                          }
                        } else {
                          log("--new user-->");
                          if (readRefrence.validatePassword(context) && readRefrence.validateConfirmPassword(context)) {
                            readRefrence.generatePassword(ref: ref, context: context);
                          }
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
