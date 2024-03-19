import 'package:cedratools/helper/assets.dart';
import 'package:cedratools/helper/colors.dart';
import 'package:cedratools/widgets/custom_elevated_button.dart';
import 'package:cedratools/widgets/custom_text_from_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class EmailView extends StatelessWidget {
  const EmailView({super.key});

  @override
  Widget build(BuildContext context) {
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
                "Enter Your Email",
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
                child: SvgPicture.asset(Assets.emailPic),
              ),
              SizedBox(
                height: 140.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 34.w),
                child: Column(
                  children: [
                    CustomTextFromField(
                      hintText: "Enter Email",
                      prefixIcon: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(Assets.userIcon),
                        ],
                      ),
                    ),
                    SizedBox(height: 33.h),
                    CustomElevatedButton(
                      text: "Next",
                      backgroundColor: kPrimaryColor,
                      height: 45.w,
                      width: double.infinity,
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
