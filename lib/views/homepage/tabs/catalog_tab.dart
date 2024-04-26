// ignore_for_file: must_be_immutable

import 'package:cedratools/helper/assets.dart';
import 'package:cedratools/helper/colors.dart';
import 'package:cedratools/models/catalog_product_response_model.dart';
import 'package:cedratools/view_models/catalog_view_model.dart';
import 'package:cedratools/views/filter_view.dart';
import 'package:cedratools/widgets/search_field.dart';
import 'package:cedratools/widgets/wish_list_product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CatalogTab extends StatefulWidget {
  CatalogTab({super.key});

  @override
  State<CatalogTab> createState() => _CatalogTabState();
}

class _CatalogTabState extends State<CatalogTab> {
  List<String> list = <String>['Most Relevant', 'Lower Price', 'Higher Price'];
  CatalogViewModel viewModal = CatalogViewModel();

  @override
  void initState() {
    viewModal.getProductList();
    super.initState();
  }

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
              height: 10,
            ),
            SearchField(),
            SizedBox(
              height: 30.h,
            ),
            Container(
              height: 65.h,
              width: double.infinity,
              child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Chip(
                      label: Text(
                        "Automotive scanner",
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: kInactiveChip,
                        ),
                      ),
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: kInactiveChip,
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(37.r),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(width: 16.w);
                  },
                  itemCount: 13),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FilterView(),
                      ),
                    );
                  },
                  icon: SvgPicture.asset(Assets.filterIcon),
                  style: IconButton.styleFrom(
                    minimumSize: Size(28.h, 28.h),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    backgroundColor: kPrimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                  ),
                ),
                Spacer(),
                Text(
                  "Sort By",
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  width: 10.h,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.r),
                    border: Border.all(
                      color: kInactiveChip,
                    ),
                  ),
                  padding: EdgeInsets.only(
                    left: 8.w,
                    top: 4.h,
                    bottom: 4.h,
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: list.first,
                      items: list.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            "$value",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12.sp,
                              color: kInactiveChip,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {},
                      padding: EdgeInsets.zero,
                      isDense: true,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 22.h,
            ),
            viewModal.catalogData == null
                ? Container()
                : GridView.count(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisSpacing: 20.h,
                    mainAxisSpacing: 32.h,
                    childAspectRatio: 0.7,
                    crossAxisCount: 2,
                    children: List.generate(
                      viewModal.catalogData!.data!.length,
                      // 23,
                      (index) {
                        Data productData = viewModal.catalogData!.data![index];
                        return WishListProductItem(
                          productData: productData,
                        );
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
