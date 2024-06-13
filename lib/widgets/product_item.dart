import 'package:cedratools/helper/app_routes.dart';
import 'package:cedratools/helper/assets.dart';
import 'package:cedratools/helper/colors.dart';
import 'package:cedratools/models/product_response_model.dart';
import 'package:cedratools/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ProductListItem extends StatelessWidget {
  const ProductListItem({
    this.product,
    super.key,
  });
  final Product? product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //product detail page
        Navigator.pushNamed(context, AppRoutes.PRODUCT_DETAIL_VIEW, arguments: product);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 2,
            ),
          ],
        ),
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(6.r),
                    topRight: Radius.circular(6.r),
                  ),
                ),
                child: ClipRRect(
                  clipBehavior: Clip.antiAlias,
                  child: Image.network(
                    width: double.infinity,
                    "${product?.image?.src ?? "https://storage.googleapis.com/proudcity/mebanenc/uploads/2021/03/placeholder-image.png"}",
                    // fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                color: kProductBg,
                padding: EdgeInsets.all(11.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (product?.variants?[0].compareAtPrice != null)
                      Text(
                        "\$${product?.variants?[0].compareAtPrice}",
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: kProductGreyText,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    Text(
                      "\$${product!.variants![0].price}",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: kChipColor,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      "${product!.title}",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w300,
                        color: kChipColor,
                      ),
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              Assets.notoCoin,
                              width: 14,
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            Text(
                              "500",
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                color: kLoyaltyPointText,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 3.h),
                          decoration: BoxDecoration(
                            color: kFreeShippingBg,
                            borderRadius: BorderRadius.circular(41.r),
                          ),
                          child: Text(
                            "Free Shipping",
                            style: TextStyle(
                              fontSize: 9.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
