// ignore_for_file: must_be_immutable

import 'package:cedratools/helper/assets.dart';
import 'package:cedratools/helper/colors.dart';
import 'package:cedratools/models/product_response_model.dart';
import 'package:cedratools/models/categories_response_model.dart';
import 'package:cedratools/models/product_model.dart';
import 'package:cedratools/view_models/catalog_view_model.dart';
import 'package:cedratools/views/filter_view.dart';
import 'package:cedratools/widgets/search_field.dart';
import 'package:cedratools/widgets/wish_list_product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CatalogueTab extends ConsumerStatefulWidget {
  CatalogueTab({super.key});

  @override
  CatalogTabState createState() => CatalogTabState();
}

class CatalogTabState extends ConsumerState<CatalogueTab> with AutomaticKeepAliveClientMixin {
  List<String> list = <String>['Most Relevant', 'Lower Price', 'Higher Price'];
  late CatalogViewModel refCatalogRead;
  late CatalogViewModel refCatalogWatch;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(cataLogViewModel).getCategories(ref);
      ref.read(cataLogViewModel).getProductList(ref);
    });
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    refCatalogRead = ref.read(cataLogViewModel);
    refCatalogWatch = ref.watch(cataLogViewModel);
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
            if (refCatalogWatch.categoriesResponseModel!.categories != null) ...[
              Container(
                height: 65.h,
                width: double.infinity,
                child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      Category category = refCatalogWatch.categoriesResponseModel!.categories![index];
                      return Chip(
                        label: Text(
                          "${category.title}",
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
                    itemCount: refCatalogWatch.categoriesResponseModel!.categories!.length),
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
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
            refCatalogWatch.catalogresponse == null
                ? Container()
                : GridView.count(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisSpacing: 20.h,
                    mainAxisSpacing: 32.h,
                    childAspectRatio: 0.7,
                    crossAxisCount: 2,
                    children: List.generate(
                      refCatalogWatch.catalogresponse!.products!.length,
                      // 23,
                      (index) {
                        Product productData = refCatalogWatch.catalogresponse!.products![index];
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
