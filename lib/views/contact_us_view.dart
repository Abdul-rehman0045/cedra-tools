import 'package:cedratools/helper/assets.dart';
import 'package:cedratools/helper/colors.dart';
import 'package:cedratools/widgets/custom_elevated_button.dart';
import 'package:cedratools/widgets/custom_text_from_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ContactUsView extends StatelessWidget {
  const ContactUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Text(
                "Leave us your message",
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 18.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 33.w),
              child: Column(
                children: [
                  CustomTextFromField(hintText: "Email"),
                  SizedBox(height: 15.h),
                  CustomTextFromField(
                    hintText: "Message",
                    maxLines: 5,
                    maxLength: 300,
                  ),
                  SizedBox(height: 6.h),
                  Align(
                    alignment: Alignment.centerRight,
                    child: CustomElevatedButton(
                      text: "Send",
                      backgroundColor: kElevatedButtonBlackBg,
                      width: 160.w,
                      height: 45.w,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 6.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Contact",
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      SvgPicture.asset(
                        Assets.whatsappIcon,
                        color: kDescriptionGreyText,
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text(
                        "5585023602",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  Row(
                    children: [
                      Icon(
                        Icons.email,
                        size: 30.r,
                        color: kDescriptionGreyText,
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text(
                        "cedratools@cedratools.com",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    "follow us",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      color: kDescriptionGreyText,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Row(
                    children: [
                      SvgPicture.asset(Assets.facebookIcon),
                      SizedBox(width: 14.w),
                      SvgPicture.asset(Assets.twitterIcon),
                      SizedBox(width: 14.w),
                      SvgPicture.asset(Assets.instaIcon),
                      SizedBox(width: 14.w),
                      SvgPicture.asset(Assets.youtubeIcon),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
