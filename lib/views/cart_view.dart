import 'package:cedratools/helper/assets.dart';
import 'package:cedratools/helper/colors.dart';
import 'package:cedratools/widgets/custom_elevated_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CartView extends StatelessWidget {
  CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
            child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return CartProduct();
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 20.w,
                  );
                },
                itemCount: 5),
          ),
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
                      "-\$60",
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
                      "\$1,710",
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
                      "\$1,710",
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
                CustomElevatedButton(text: "Checkout", backgroundColor: kPrimaryColor, height: 50.w, width: double.infinity),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CartProduct extends StatelessWidget {
  const CartProduct({
    super.key,
  });

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
            height: 200.h,
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    height: double.infinity,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    child: Image.network(
                      "https://c0.wallpaperflare.com/preview/908/343/586/5be94738e2b7b.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: 8.5.w,
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Launch Creader 359 Scanner 70 Brands & 29 Resetters",
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Text(
                          "10% OFF",
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
                            color: kOff,
                          ),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Row(
                          children: [
                            Text(
                              "\$1,900",
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500,
                                color: kDescriptionGreyText.withOpacity(0.5),
                              ),
                            ),
                            SizedBox(
                              width: 4.w,
                            ),
                            Text(
                              "\$1,710",
                              style: TextStyle(
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Text(
                          "in 3 months without interest \$570VAT included",
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: kDescriptionGreyText,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 4.h,
          ),
          Divider(
            color: Colors.grey.shade400,
          ),
          SizedBox(
            height: 4.h,
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
                      onTap: () {},
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
                        "2",
                        style: TextStyle(
                          color: kDescriptionBlackText,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6.w),
                        child: Icon(Icons.add),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              SvgPicture.asset(Assets.deleteIcon),
            ],
          ),
        ],
      ),
    );
  }
}
