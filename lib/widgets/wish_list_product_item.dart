import 'package:cedratools/helper/colors.dart';
import 'package:cedratools/models/catalog_product_response_model.dart' as cata;
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WishListProductItem extends StatelessWidget {
  const WishListProductItem({
    this.productData,
    super.key,
  });
  final cata.Data? productData;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  // "https://hi-spec.com/cdn/shop/articles/Tools_Every_DIY_Mechanic_Needs_-_Header_image.jpg?v=1640855146",
                  "${productData?.image?.src}",
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
                  Text(
                    "\$${productData!.variants![0].price}",
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: kProductGreyText,
                    ),
                  ),
                  Text(
                    // "\$11,610",
                    "\$${productData!.variants![0].price}",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: kInactiveChip,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    // "12x \$870.75 without interest Launch Creader 359 Scanner 70 Brands & 29 Resetters",
                    "${productData!.title}",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w300,
                      color: kInactiveChip,
                    ),
                  ),
                  Spacer(),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
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
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
