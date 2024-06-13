import 'dart:ffi';

import 'package:cedratools/helper/assets.dart';
import 'package:cedratools/helper/colors.dart';
import 'package:cedratools/models/product_response_model.dart';
import 'package:cedratools/models/product_model.dart';
import 'package:cedratools/view_models/cart_view_model.dart';
import 'package:cedratools/widgets/custom_elevated_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CartView extends ConsumerWidget {
  CartView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var refCartRead = ref.read(cartViewModel);
    var refCartWatch = ref.watch(cartViewModel);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Cart",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20.sp,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: refCartWatch.cartList.isEmpty
                ? Center(
                    child: Text("Cart is Empty"),
                  )
                : ListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      Product product = refCartRead.cartList[index];
                      return CartProduct(
                        product: product,
                        index: index,
                        cartRefrence: refCartWatch,
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 20.w,
                      );
                    },
                    itemCount: refCartWatch.cartList.length),
          ),
          if (refCartWatch.cartList.isNotEmpty)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(Assets.coinIcon),
                      SizedBox(
                        width: 6.w,
                      ),
                      Text(
                        "Use Coins",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                          color: Color(0xFF263238),
                        ),
                      ),
                      Spacer(),
                      Text(
                        "0",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                        ),
                      ),
                      SizedBox(
                        width: 12.w,
                      ),
                      Switch(
                        activeTrackColor: kSwitchBg,
                        activeColor: kPrimaryColor,
                        value: true,
                        onChanged: (value) {},
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.grey.shade400,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "Purchase summary",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      color: Color(0xFF263238),
                    ),
                  ),
                  SizedBox(
                    height: 9.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Product",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                          color: Color(0xFF263238),
                        ),
                      ),
                      Text(
                        "\$${refCartWatch.totalPrice}",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Shipping Cost",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                          color: kShippingCost,
                        ),
                      ),
                      Text(
                        "Free",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14.sp,
                          color: kShippingCost,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                          color: Color(0xFF263238),
                        ),
                      ),
                      Text(
                        "\$${refCartWatch.totalPrice}",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.w,
                  ),
                  Divider(
                    color: Colors.grey.shade400,
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  CustomElevatedButton(
                    text: "Checkout",
                    backgroundColor: kPrimaryColor,
                    height: 50.w,
                    width: double.infinity,
                    onPressed: () {
                      refCartRead.checkout(context, ref);
                    },
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class CartProduct extends StatelessWidget {
  CartProduct({
    required this.product,
    required this.index,
    required this.cartRefrence,
    super.key,
  });
  final Product product;
  final int index;
  final CartViewModel cartRefrence;

  String getDiscount(String price, String totalPrice) {
    double discount = (100 - (double.parse(price) / double.parse(totalPrice)) * 100);
    return discount.toStringAsFixed(0);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14.r),
      decoration: BoxDecoration(
        color: kCartProductBg,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 2,
            spreadRadius: 1,
            offset: Offset(1, 0),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            // height: 250.h,
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    // height: double.infinity,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    child: Image.network(
                      "${product.image?.src}",
                    ),
                  ),
                ),
                SizedBox(
                  width: 7.5.w,
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${product.title}",
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 2.5.h,
                        ),
                        Text(
                          "${getDiscount(product.variants![0].price!, product.variants![0].compareAtPrice!)}% OFF",
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
                            color: kOff,
                          ),
                        ),
                        SizedBox(
                          height: 3.5.h,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "\$${product.variants?[0].compareAtPrice}",
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500,
                                color: kDescriptionGreyText.withOpacity(0.5),
                                decoration: TextDecoration.lineThrough,
                                decorationColor: kProductGreyText,
                              ),
                            ),
                            SizedBox(
                              width: 4.w,
                            ),
                            Text(
                              "\$${product.variants?[0].price}",
                              style: TextStyle(
                                fontSize: 21.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        // SizedBox(
                        //   height: 4.h,
                        // ),
                        // Text(
                        //   "in 3 months without interest \$570VAT included",
                        //   style: TextStyle(
                        //     fontSize: 12.sp,
                        //     fontWeight: FontWeight.w400,
                        //     color: kDescriptionGreyText,
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.grey.shade400,
          ),
          Row(
            children: [
              Text(
                "Quantity",
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                width: 14.w,
              ),
              Container(
                height: 45.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.r),
                  border: Border.all(
                    color: kDescriptionBlackText,
                    width: 1.2,
                  ),
                ),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        cartRefrence.removeQuantity(product);
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6.w),
                        child: Icon(Icons.remove),
                      ),
                    ),
                    Container(
                      width: 50.h,
                      alignment: Alignment.center,
                      margin: EdgeInsets.zero,
                      color: kQuantityBg,
                      child: Text(
                        // "2",
                        "${product.userSelectedQuantity}",
                        style: TextStyle(
                          color: kDescriptionBlackText,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        cartRefrence.addQuantity(product.variants?[0].inventoryQuantity, product);
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6.w),
                        child: Icon(Icons.add),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              InkWell(
                onTap: () {
                  cartRefrence.removeFromCart(index);
                },
                child: SvgPicture.asset(Assets.deleteIcon),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
