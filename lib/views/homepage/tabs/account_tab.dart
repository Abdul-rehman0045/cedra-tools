import 'package:cedratools/helper/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountTab extends StatelessWidget {
  const AccountTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            onTap: () {},
            title: Text(
              "Edit Profile",
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
                color: kPrimaryColor,
              ),
            ),
          ),
          ListTile(
            onTap: () {},
            title: Text(
              "Change Password",
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
                color: kPrimaryColor,
              ),
            ),
          ),
          ListTile(
            onTap: () {},
            title: Text(
              "Privacy",
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
                color: kPrimaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
