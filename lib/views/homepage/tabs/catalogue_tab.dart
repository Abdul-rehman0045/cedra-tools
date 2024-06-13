// ignore_for_file: must_be_immutable

import 'package:cedratools/helper/assets.dart';
import 'package:cedratools/helper/colors.dart';
import 'package:cedratools/models/product_response_model.dart';
import 'package:cedratools/models/categories_response_model.dart';
import 'package:cedratools/models/product_model.dart';
import 'package:cedratools/view_models/product_view_model.dart';
import 'package:cedratools/views/filter_view.dart';
import 'package:cedratools/widgets/search_field.dart';
import 'package:cedratools/widgets/product_item.dart';
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
  late ProductViewModel viewModel;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(productViewModel).getCategories(ref);
      ref.read(productViewModel).getProductsByCategory(ref);
    });
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    viewModel = ref.watch(productViewModel);
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SearchField(
            controller: viewModel.search,
            onChanged: (val) {
              if (val.isNotEmpty) {
                //api call
                viewModel.getProductsByCategory(ref, showLoader: false);
              }
            },
          ),
        ),
        SizedBox(
          height: 30.h,
        ),
        if (viewModel.categoriesResponseModel?.categories != null) ...[
          Container(
            height: 65.h,
            width: double.infinity,
            child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  Category category = viewModel.categoriesResponseModel!.categories![index];
                  return RawChip(
                    onPressed: () {
                      if (index == 0) {
                        viewModel.setSelectedCategory(null);
                        // viewModel.getProductsByCategory(ref);
                      } else {
                        viewModel.setSelectedCategory(category);
                        // viewModel.getProductsByCategory(ref);
                      }

                      viewModel.setSelectedCategoryIndex(index);
                      viewModel.getProductsByCategory(ref);
                    },
                    backgroundColor: viewModel.selectedCategoryIndex == index ? kChipColor : Colors.white,
                    label: Text(
                      "${category.title}",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: viewModel.selectedCategoryIndex == index ? Colors.white : kChipColor,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: kChipColor,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(37.r),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(width: 10.w);
                },
                itemCount: viewModel.categoriesResponseModel!.categories!.length),
          ),
          SizedBox(
            height: 20.h,
          ),
        ],
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // IconButton(
              //   onPressed: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //         builder: (context) => FilterView(),
              //       ),
              //     );
              //   },
              //   icon: SvgPicture.asset(Assets.filterIcon),
              //   style: IconButton.styleFrom(
              //     minimumSize: Size(28.h, 28.h),
              //     tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              //     backgroundColor: kPrimaryColor,
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(6.r),
              //     ),
              //   ),
              // ),
              // Spacer(),
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
                    color: kChipColor,
                  ),
                ),
                padding: EdgeInsets.only(
                  left: 8.w,
                  top: 4.h,
                  bottom: 4.h,
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<Map<String, dynamic>>(
                    hint: Text(
                      "${viewModel.sortByList.first['title']}",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        color: kChipColor,
                      ),
                    ),
                    value: viewModel.selectedSortBy,
                    items: viewModel.sortByList.map<DropdownMenuItem<Map<String, dynamic>>>((Map<String, dynamic> value) {
                      return DropdownMenuItem<Map<String, dynamic>>(
                        value: value,
                        child: Text(
                          "${value['title']}",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp,
                            color: kChipColor,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      viewModel.setSelectedSortBy(value!);
                      viewModel.getProductsByCategory(ref);
                    },
                    padding: EdgeInsets.zero,
                    isDense: true,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 22.h,
        ),
        Expanded(
          child: viewModel.productResponse == null
              ? Container()
              : viewModel.productResponse!.products!.isEmpty
                  ? Center(
                      child: Text(
                        "No Products Found",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  : GridView.count(
                      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                      crossAxisSpacing: 20.h,
                      mainAxisSpacing: 20.h,
                      childAspectRatio: 0.7,
                      crossAxisCount: 2,
                      children: List.generate(
                        viewModel.productResponse!.products!.length,
                        (index) {
                          Product productData = viewModel.productResponse!.products![index];
                          return ProductListItem(
                            product: productData,
                          );
                        },
                      ),
                    ),
        ),
      ],
    );
  }
}
