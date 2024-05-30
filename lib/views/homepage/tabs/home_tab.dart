// ignore_for_file: must_be_immutable

import 'package:cedratools/helper/app_routes.dart';
import 'package:cedratools/helper/assets.dart';
import 'package:cedratools/helper/colors.dart';
import 'package:cedratools/models/catalog_response_model.dart';
import 'package:cedratools/view_models/cart_view_model.dart';
import 'package:cedratools/view_models/home_view_model.dart';
import 'package:cedratools/views/cart_view.dart';
import 'package:cedratools/views/product_detail_view.dart';
import 'package:cedratools/views/reward_view.dart';
import 'package:cedratools/widgets/custom_appbar.dart';
import 'package:cedratools/widgets/search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomeTab extends ConsumerStatefulWidget {
  HomeTab({super.key, required this.controller});
  AdvancedDrawerController controller;
  @override
  HomeTabState createState() => HomeTabState();
}

class HomeTabState extends ConsumerState<HomeTab> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(homeViewModel).getProductList(ref);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var refCartRead = ref.read(cartViewModel);
    var refCartWatch = ref.watch(cartViewModel);
    var refCatalogWatch = ref.watch(homeViewModel);

    return Scaffold(
      backgroundColor: kHomeScaffoldBg,
      // appBar: CustomAppBar(),
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            widget.controller.showDrawer();
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(Assets.drawer),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.REWARD_VIEW,
                    );
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(Assets.notoCoin),
                    ],
                  ),
                ),
                SizedBox(
                  width: 12.w,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.CART_VIEW);
                  },
                  child: refCartWatch.cartList.isEmpty
                      ? SvgPicture.asset(Assets.cart)
                      : Badge(
                          backgroundColor: kBadgeBg,
                          label: Text("${refCartWatch.cartList.length}"),
                          textStyle: TextStyle(fontSize: 10.sp),
                          child: SvgPicture.asset(Assets.cart),
                        ),
                ),
              ],
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 22.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: SearchField(),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 19.w,
                  vertical: 6.h,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(
                    color: Color(0xFFe4d9f8),
                  ),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      Assets.loyaltyCoinIcon,
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Expanded(
                      child: Text(
                        "1,200",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: kLoyaltyPointText,
                        ),
                      ),
                    ),
                    Text(
                      "Coins",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF475467),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            Container(
              height: 155,
              width: double.infinity,
              margin: EdgeInsets.only(left: 30.w),
              child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 155.h,
                      width: 327.w,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        // boxShadow: [
                        //   BoxShadow(
                        //     color: Colors.grey.withOpacity(0.2),
                        //     spreadRadius: 2,
                        //     blurRadius: 2,
                        //   ),
                        // ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.r),
                        clipBehavior: Clip.antiAlias,
                        child: Image.asset(
                          Assets.slider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: 18.w,
                    );
                  },
                  itemCount: 3),
            ),
            SizedBox(
              height: 29.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Text(
                "Buy our discounted products and receive them today!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kDiscountProductText,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: 22.h,
            ),
            refCatalogWatch.catalogresponse == null
                ? Container()
                : CategoryWidget(
                    heading: CategoryTypesWidget(),
                    productRef: refCatalogWatch,
                  ),
            // SizedBox(
            //   height: 18.h,
            // ),
            // CategoryWidget(
            //   heading: Padding(
            //     padding: EdgeInsets.symmetric(horizontal: 20.w),
            //     child: Row(
            //       children: [
            //         Text(
            //           "Discount Items with Coins",
            //           style: TextStyle(
            //             fontSize: 12.sp,
            //             fontWeight: FontWeight.w600,
            //             color: Colors.black,
            //           ),
            //         ),
            //         Spacer(),
            //         TextButton(
            //           onPressed: () {},
            //           style: TextButton.styleFrom(
            //             padding: EdgeInsets.zero,
            //             tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            //             minimumSize: Size.zero,
            //           ),
            //           child: Text(
            //             "More>>",
            //             style: TextStyle(
            //               fontSize: 12.sp,
            //               fontWeight: FontWeight.w600,
            //               color: kBlueTextBtn,
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: 18.h,
            // ),
            // CategoryWidget(
            //   heading: Padding(
            //     padding: EdgeInsets.symmetric(horizontal: 20.w),
            //     child: Row(
            //       children: [
            //         Text(
            //           "Recommended products",
            //           style: TextStyle(
            //             fontSize: 12.sp,
            //             fontWeight: FontWeight.w600,
            //             color: Colors.black,
            //           ),
            //         ),
            //         Spacer(),
            //         TextButton(
            //           onPressed: () {},
            //           style: TextButton.styleFrom(
            //             padding: EdgeInsets.zero,
            //             tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            //             minimumSize: Size.zero,
            //           ),
            //           child: Text(
            //             "More>>",
            //             style: TextStyle(
            //               fontSize: 12.sp,
            //               fontWeight: FontWeight.w600,
            //               color: kBlueTextBtn,
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class CategoryWidget extends StatelessWidget {
  CategoryWidget({
    super.key,
    required this.heading,
    this.productRef,
  });
  Widget heading;
  HomeViewModel? productRef;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // CategoryTypesWidget(),
        heading,
        SizedBox(
          height: 10.h,
        ),
        Container(
          margin: EdgeInsets.only(left: 13.w),
          height: 330.h,
          width: double.infinity,
          child: productRef == null && productRef!.catalogresponse == null
              ? Container()
              : ListView.separated(
                  padding: EdgeInsets.only(top: 10.h),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 9,
                  itemBuilder: (context, index) {
                    CatalogProductList productData = productRef!.catalogresponse!.catalogProductList![index];
                    return Container(
                      width: 239.w,
                      margin: EdgeInsets.only(bottom: 2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.r),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 2,
                          ),
                        ],
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, AppRoutes.PRODUCT_DETAIL_VIEW, arguments: productData);
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              flex: 3,
                              child: Container(
                                width: double.infinity,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(6.r),
                                  topRight: Radius.circular(6.r),
                                )),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(6.r),
                                    topRight: Radius.circular(6.r),
                                  ),
                                  child: Image.network(
                                    "${productData.image?.src}",
                                    // fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: kProductBg,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(6.r),
                                    bottomRight: Radius.circular(6.r),
                                  ),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: 7.w, right: 7.w, top: 8.h),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                // "\$11,610",
                                                "\$${productData.variants![0].compareAtPrice}",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 12.sp,
                                                  color: kProductGreyText,
                                                  decoration: TextDecoration.lineThrough,
                                                  decorationColor: kProductGreyText,
                                                ),
                                              ),
                                              Text(
                                                // "\$11,610",
                                                "\$${productData.variants![0].price}",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 14.sp,
                                                  color: kInactiveChip,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 4.h),
                                            decoration: BoxDecoration(
                                              color: kFreeShippingBg,
                                              borderRadius: BorderRadius.circular(41.r),
                                            ),
                                            child: Text(
                                              "Free Shipping",
                                              style: TextStyle(
                                                fontSize: 8.sp,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 8.w),
                                      child: Text(
                                        // "12x \$870.75 without interest Launch Creader 359 Scanner 70 Brands & 29 Resetters",
                                        "${productData.title}",
                                        maxLines: 3,
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w300,
                                          color: kInactiveChip,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: 11.w,
                    );
                  },
                ),
        ),
      ],
    );
  }
}

class CategoryTypesWidget extends StatelessWidget {
  const CategoryTypesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        children: [
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              minimumSize: Size.zero,
            ),
            child: Text(
              "Promotions",
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color: kBlueTextBtn,
                decoration: TextDecoration.underline,
                decorationColor: kBlueTextBtn,
              ),
            ),
          ),
          SizedBox(
            width: 13.w,
          ),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              minimumSize: Size.zero,
            ),
            child: Text(
              "More Popular",
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            width: 13.w,
          ),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              minimumSize: Size.zero,
            ),
            child: Text(
              "Free Shipping",
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
          Spacer(),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              minimumSize: Size.zero,
            ),
            child: Text(
              "More>>",
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color: kBlueTextBtn,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
