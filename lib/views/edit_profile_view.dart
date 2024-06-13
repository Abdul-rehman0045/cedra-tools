// ignore_for_file: must_be_immutable

import 'package:cedratools/helper/assets.dart';
import 'package:cedratools/helper/base_helper.dart';
import 'package:cedratools/helper/colors.dart';
import 'package:cedratools/helper/hide_keypad_on_outside_tap.dart';
import 'package:cedratools/view_models/auth_view_model.dart';
import 'package:cedratools/views/homepage/homepage_view.dart';
import 'package:cedratools/widgets/custom_elevated_button.dart';
import 'package:cedratools/widgets/custom_text_from_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class EditProfileView extends ConsumerStatefulWidget {
  const EditProfileView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends ConsumerState<EditProfileView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(authControllerProvider).getUserProfile(ref);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AuthViewModel authViewModel = ref.watch(authControllerProvider);
    return HideKeyPadOnOutsideTap(
      child: Scaffold(
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
                  "Edit Profile",
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
                  padding: EdgeInsets.symmetric(horizontal: 34.w),
                  child: Column(
                    children: [
                      CustomTextFromField(
                        controller: authViewModel.nameEditingController,
                        hintText: "Name",
                        prefixIcon: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(Assets.nameIcon),
                          ],
                        ),
                      ),
                      SizedBox(height: 31.h),
                      CustomTextFromField(
                        controller: authViewModel.emailEditingController,
                        hintText: "Email",
                        readOnly: true,
                        prefixIcon: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(Assets.userIcon),
                          ],
                        ),
                      ),
                      SizedBox(height: 31.h),
                      CustomTextFromField(
                        controller: authViewModel.phoneEditingController,
                        hintText: "WhatsApp Number",
                        keyboardType: TextInputType.phone,
                        prefixIcon: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(Assets.whatsappIcon),
                          ],
                        ),
                        // suffixIcon: IconButton(
                        //   icon: SvgPicture.asset(Assets.infoIcon),
                        //   onPressed: () {},
                        // ),
                      ),
                      SizedBox(height: 31.h),
                      CustomElevatedButton(
                        text: "Save",
                        backgroundColor: kPrimaryColor,
                        height: 45.w,
                        width: double.infinity,
                        onPressed: () {
                          ref.read(authControllerProvider).updateUserProfile(ref);
                          Navigator.pop(context);
                          BaseHelper.showSnackBar(context, 'Profile updated successfully', isError: false);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
