// ignore_for_file: must_be_immutable, unused_local_variable

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cedratools/helper/assets.dart';
import 'package:cedratools/helper/colors.dart';
import 'package:cedratools/models/product_response_model.dart';
import 'package:cedratools/models/product_model.dart';
import 'package:cedratools/view_models/cart_view_model.dart';
import 'package:cedratools/view_models/product_details_viewmodel.dart';
import 'package:cedratools/widgets/custom_elevated_button.dart';
import 'package:cedratools/widgets/custom_paint.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ProductDetailView extends ConsumerStatefulWidget {
  final dynamic map;
  ProductDetailView({super.key, required this.map});

  @override
  ProductDetailViewState createState() => ProductDetailViewState();
}

class ProductDetailViewState extends ConsumerState<ProductDetailView> {
  bool isDescriptionShow = false;
  Product? product;

  @override
  void initState() {
    product = widget.map;
    ref.read(productDetailsViewModel).quantity = product!.userSelectedQuantity;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var refCartRead = ref.read(cartViewModel);
    var refCartWatch = ref.watch(cartViewModel);
    var refProductInfoRead = ref.read(productDetailsViewModel);
    var refProductInfoWatch = ref.watch(productDetailsViewModel);
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
          ),
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      imageSlider(product!, refProductInfoWatch),
                      // Container(
                      //   width: double.infinity,
                      //   height: 300.h,
                      //   color: kProductDetailsBg,
                      //   padding: EdgeInsets.symmetric(vertical: 10.h),
                      //   child: Image.network(
                      //     "${product?.images?[0].src}",
                      //     // fit: BoxFit.cover,
                      //   ),
                      // ),

                      // Image.asset(
                      //   Assets.tooltipText,
                      // ),
                      // Stack(
                      //   alignment: Alignment.center,
                      //   children: [
                      //     Image.asset(Assets.tooltip),
                      //     Transform.translate(
                      //       offset: Offset(0, 5.h),
                      //       child: Row(
                      //         mainAxisSize: MainAxisSize.min,
                      //         children: [
                      //           SvgPicture.asset(Assets.truck),
                      //           Text(
                      //             "Free shipping",
                      //             style: TextStyle(
                      //               fontSize: 12.sp,
                      //               fontWeight: FontWeight.w500,
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 28.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                // Text(
                                //   "New",
                                //   style: TextStyle(
                                //     fontSize: 12.sp,
                                //     fontWeight: FontWeight.w400,
                                //     color: kDescriptionGreyText,
                                //   ),
                                // ),
                                // Spacer(),
                                Text(
                                  "Nationwide",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color: kDescriptionGreyText,
                                  ),
                                ),
                                SizedBox(
                                  width: 13.w,
                                ),
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
                            SizedBox(
                              height: 6.h,
                            ),
                            Text(
                              // "Inspection Camera - Launch Vsp600 Automotive Videoscope",
                              "${product?.title}",
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                                color: kDescriptionBlackText,
                              ),
                            ),
                            SizedBox(
                              height: 7.h,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (product?.variants?[0].compareAtPrice != null)
                                      Text(
                                        "\$${product?.variants?[0].compareAtPrice}",
                                        style: TextStyle(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w500,
                                          color: kDescriptionGreyText,
                                          decoration: TextDecoration.lineThrough,
                                          decorationColor: kProductGreyText,
                                        ),
                                      ),
                                    Text(
                                      "\$${product?.variants?[0].price}",
                                      style: TextStyle(
                                        fontSize: 24.sp,
                                        fontWeight: FontWeight.w700,
                                        color: kDescriptionBlackText,
                                      ),
                                    ),
                                  ],
                                ),
                                // Spacer(),
                                // TextButton(
                                //   onPressed: () {},
                                //   style: TextButton.styleFrom(
                                //     padding: EdgeInsets.zero,
                                //     tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                //     minimumSize: Size.zero,
                                //   ),
                                //   child: Text(
                                //     "See payment methods",
                                //     style: TextStyle(
                                //       fontSize: 12.sp,
                                //       fontWeight: FontWeight.w700,
                                //       color: kBlueTextBtn,
                                //       decoration: TextDecoration.underline,
                                //       decorationColor: kBlueTextBtn,
                                //     ),
                                //   ),
                                // ),
                              ],
                            ),
                            // SizedBox(
                            //   height: 12.h,
                            // ),
                            // Text(
                            //   "in 3 months without interest\$570VAT included",
                            //   style: TextStyle(
                            //     fontSize: 14.sp,
                            //     fontWeight: FontWeight.w400,
                            //     color: kDescriptionGreyText,
                            //   ),
                            // ),
                            SizedBox(
                              height: 12.h,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Brand",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700,
                                    color: kDescriptionBlackText,
                                  ),
                                ),
                                SizedBox(
                                  width: 65.w,
                                ),
                                Text(
                                  // "Launch",
                                  "${product?.vendor}",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700,
                                    color: kDescriptionBlackText,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Model",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700,
                                    color: kDescriptionBlackText,
                                  ),
                                ),
                                SizedBox(
                                  width: 65.w,
                                ),
                                Text(
                                  "VSP-600", // TODO
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700,
                                    color: kDescriptionBlackText,
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              height: 14.h,
                              color: Colors.grey.shade200,
                              thickness: 1.5,
                            ),
                            SizedBox(
                              height: 7.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Description",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700,
                                    color: kDescriptionBlackText,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      isDescriptionShow = !isDescriptionShow;
                                    });
                                  },
                                  child: Icon(
                                    isDescriptionShow ? Icons.keyboard_arrow_up_outlined : Icons.keyboard_arrow_down_outlined,
                                    color: kDescriptionBlackText,
                                  ),
                                ),
                              ],
                            ),
                            if (isDescriptionShow)
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 9.h,
                                  ),
                                  Html(data: "${product?.bodyHtml}"),
                                  // Text(
                                  //   "The Launch VSP600 Automotive Videoscope Inspection Camera is an essential tool for any professional in the automotive sector. This high-tech device allows visual inspections in hard-to-reach areas, providing clear and detailed images that facilitate vehicle diagnosis and repair.The Launch brand, recognized worldwide for its quality and durability, guarantees exceptional performance with every use. The VSP-600 model stands out for its ergonomic design and easy handling, allowing comfortable and efficient use, even during long work days.This automotive video scope features a high-resolution camera that provides sharp, precise images. Its adjustable LED lighting allows clear vision in low light conditions, making it easy to identify problems and anomalies inside vehicles.Additionally, the Launch VSP600 is compatible with a wide range of vehicles, making it a versatile and valuable tool for any workshop or garage. Its durability and resistance make it ideal for daily use in demanding work environments. With the Launch VSP600 Automotive Videoscope Inspection Camera, you will have a clear and precise view of what is happening inside the vehicles, allowing you to make more efficient and effective repairs.",
                                  //   style: TextStyle(
                                  //     fontWeight: FontWeight.w400,
                                  //     fontSize: 12.sp,
                                  //     color: kDescriptionGreyText,
                                  //   ),
                                  // ),
                                ],
                              ),
                            SizedBox(
                              height: 7.h,
                            ),
                            Divider(
                              height: 14.h,
                              color: Colors.grey.shade200,
                              thickness: 1.5,
                            ),
                            SizedBox(
                              height: 7.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Available stock  ( ${product?.variants?[0].inventoryQuantity < 0 ? '0' : product?.variants?[0].inventoryQuantity} )",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700,
                                    color: kDescriptionBlackText,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Quantity",
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w700,
                                        color: kDescriptionBlackText,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8.h,
                                    ),
                                    Container(
                                      height: 55.h,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(3.5.r),
                                        border: Border.all(
                                          color: kDescriptionBlackText,
                                          width: 1.2,
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              refProductInfoRead.removeQuantity(product!);
                                            },
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 6.w),
                                              child: Icon(Icons.remove),
                                            ),
                                          ),
                                          Container(
                                            width: 60.h,
                                            alignment: Alignment.center,
                                            margin: EdgeInsets.zero,
                                            color: kQuantityBg,
                                            child: Text(
                                              "${refProductInfoWatch.quantity}",
                                              style: TextStyle(
                                                color: kDescriptionBlackText,
                                                fontSize: 18.sp,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              refProductInfoRead.addQuantity(product?.variants?[0].inventoryQuantity, product!);
                                            },
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 6.w),
                                              child: Icon(Icons.add),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 28.w),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomElevatedButton(
                        text: "Buy Now",
                        backgroundColor: kPrimaryColor,
                        width: 150.w,
                        height: 45.w,
                        fontSize: 18.sp,
                        enabled: product?.variants?[0].inventoryQuantity > 0 && refProductInfoWatch.quantity > 0,
                        onPressed: () {
                          refCartRead.buyNow(context, ref, product: product!, quantity: refProductInfoWatch.quantity);
                        },
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Builder(builder: (context) {
                      bool isInCart = refCartRead.cartList.contains(product);
                      return isInCart
                          ? Expanded(
                              child: CustomElevatedButton(
                                text: "Update",
                                backgroundColor: kElevatedButtonBlackBg,
                                width: 150.w,
                                height: 45.w,
                                fontSize: 18.sp,
                                onPressed: () {
                                  refCartRead.addToCart(
                                    widget.map,
                                    product?.variants?[0].inventoryQuantity,
                                    refProductInfoRead.quantity,
                                  );
                                },
                              ),
                            )
                          : Expanded(
                              child: CustomElevatedButton(
                                text: "Add to cart",
                                backgroundColor: kElevatedButtonBlackBg,
                                width: 150.w,
                                height: 45.w,
                                fontSize: 18.sp,
                                enabled: product?.variants?[0].inventoryQuantity > 0 && refProductInfoWatch.quantity > 0,
                                onPressed: () {
                                  refCartRead.addToCart(
                                    widget.map,
                                    product?.variants?[0].inventoryQuantity,
                                    refProductInfoRead.quantity,
                                  );
                                },
                              ),
                            );
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //image slider func

  Widget imageSlider(Product product, ProductDetailsViewModel productDetailsViewModel) {
    return Column(
      children: [
        CarouselSlider(
          items: product.images!
              .map((item) => Container(
                    child: Center(
                      child: Image.network(item.src!),
                    ),
                  ))
              .toList(),
          options: CarouselOptions(
            height: 300.h,
            // autoPlay: true,
            enableInfiniteScroll: false,
            enlargeCenterPage: true,
            aspectRatio: 16 / 9,
            onPageChanged: (index, reason) {
              productDetailsViewModel.setImageSliderIndex(index);
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: product.images!.map((url) {
            int index = product.images!.indexOf(url);
            return Container(
              width: 8.0,
              height: 8.0,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: productDetailsViewModel.imageSliderIndex == index ? kPrimaryColor : Colors.grey[200],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
