import 'package:cedratools/helper/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: AppBar(
        backgroundColor: kHomeScaffoldBg,
        leadingWidth: 0,
        // leading: IconButton(
        //   onPressed: () {},
        //   icon: Icon(
        //     Icons.draw_rounded,
        //   ),
        // ),
        leading: Icon(
          Icons.draw_rounded,
        ),
        actions: [
          // IconButton(
          //   onPressed: () {},
          //   icon: Icon(
          //     Icons.shopping_cart_rounded,
          //   ),
          // ),
          Icon(
            Icons.shopping_cart_rounded,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
