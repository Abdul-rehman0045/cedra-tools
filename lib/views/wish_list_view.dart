import 'package:cedratools/helper/colors.dart';
import 'package:cedratools/widgets/search_field.dart';
import 'package:cedratools/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WishListView extends StatelessWidget {
  const WishListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kHomeScaffoldBg,
      appBar: AppBar(
        backgroundColor: kHomeScaffoldBg,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            SearchField(),
            SizedBox(
              height: 22.h,
            ),
            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisSpacing: 20.h,
              mainAxisSpacing: 32.h,
              childAspectRatio: 0.7,
              crossAxisCount: 2,
              children: List.generate(
                23,
                (index) {
                  return ProductListItem();
                },
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
          ],
        ),
      ),
    );
  }
}
