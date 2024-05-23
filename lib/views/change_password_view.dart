// ignore_for_file: must_be_immutable

import 'package:cedratools/helper/assets.dart';
import 'package:cedratools/helper/colors.dart';
import 'package:cedratools/view_models/change_password_view_model.dart';
import 'package:cedratools/widgets/custom_elevated_button.dart';
import 'package:cedratools/widgets/custom_text_from_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ChangePasswordView extends ConsumerWidget {
  ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var readRefrence = ref.read(changePasswordViewModel);
    var watchRefrence = ref.watch(changePasswordViewModel);
    return Scaffold(
      backgroundColor: Colors.white,
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
                "Change password?",
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
                hintText: "Enter your old password",
                controller: readRefrence.oldPasswordEditingController,
                maxLines: 1,
                obscureText: !watchRefrence.isOldPasswordVisible,
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
                        readRefrence.setOldPasswordVisible();
                      },
                      child: watchRefrence.isOldPasswordVisible
                          ? Icon(Icons.visibility)
                          : Icon(
                              Icons.visibility_off,
                            ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              CustomTextFromField(
                hintText: "Enter your new password",
                controller: readRefrence.newPasswordEditingController,
                obscureText: !watchRefrence.isNewPasswordVisible,
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
                        readRefrence.setNewPasswordVisible();
                      },
                      child: watchRefrence.isNewPasswordVisible
                          ? Icon(Icons.visibility)
                          : Icon(
                              Icons.visibility_off,
                            ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
              CustomElevatedButton(
                text: "Change",
                backgroundColor: kPrimaryColor,
                height: 45.w,
                width: double.infinity,
                onPressed: () {
                  readRefrence.changePassword(ref);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
