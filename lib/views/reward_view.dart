import 'package:cedratools/helper/assets.dart';
import 'package:cedratools/helper/colors.dart';
import 'package:cedratools/models/product_model.dart';
import 'package:cedratools/view_models/home_view_model.dart';
import 'package:cedratools/view_models/product_view_model.dart';
import 'package:cedratools/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class RewardView extends ConsumerStatefulWidget {
  const RewardView({super.key});

  @override
  RewardViewState createState() => RewardViewState();
}

class RewardViewState extends ConsumerState<RewardView> {
  int? weekDay;
  String? lastClaimDateString;
  late String todayDateString;
  DateTime todayDate = DateTime.now();
  late ProductViewModel viewModel;

  @override
  void initState() {
    weekDay = todayDate.weekday;
    getTodayDateString();
    getClaimStatus();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(productViewModel).getProducts(ref);
    });

    super.initState();
  }

  void getClaimStatus() async {
    DateTime? lastClaimDate;
    await ref.read(homeViewModel).checkClaimStatus();
    String? date = ref.read(homeViewModel).claimStatusObj?.lastClaimDate;
    if (date != null) {
      lastClaimDate = DateFormat("yyyy-MM-dd").parse(date);
      lastClaimDateString = DateFormat('yyyy-MM-dd').format(lastClaimDate);
    }
  }

  void getTodayDateString() {
    todayDateString = DateFormat('yyyy-MM-dd').format(todayDate);
  }

  void setWeekDay() {
    if (weekDay == 0) {
      weekDay = 1;
    } else {
      weekDay = weekDay! + 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    viewModel = ref.watch(productViewModel);

    int coin = 0;
    weekDay = 0;
    setWeekDay();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 520.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(Assets.rewardBg),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.all(16.r),
                  margin: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 30.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    gradient: LinearGradient(
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                      colors: [
                        Color(0xFFFFB24A),
                        Color(0xFFEE8F0F),
                      ],
                    ),
                    border: Border.all(
                      color: Color(0xFFFFF4E6),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Daily check-in Progress",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 6.h,
                      ),
                      Text(
                        "You will get extra points in the seventh time you check in each week.",
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFFFF4E6),
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // children: [
                        //   InactiveRewardWidget(disable: 1 < weekDay!, coming: 1 > weekDay!, day: weekDay == 1 ? null : 1),
                        //   InactiveRewardWidget(disable: 2 < weekDay!, coming: 2 > weekDay!, day: weekDay == 2 ? null : 2),
                        //   InactiveRewardWidget(disable: 3 < weekDay!, coming: 3 > weekDay!, day: weekDay == 3 ? null : 3),
                        //   InactiveRewardWidget(disable: 4 < weekDay!, coming: 4 > weekDay!, day: weekDay == 4 ? null : 4),
                        //   InactiveRewardWidget(disable: 5 < weekDay!, coming: 5 > weekDay!, day: weekDay == 5 ? null : 5),
                        //   InactiveRewardWidget(disable: 6 < weekDay!, coming: 6 > weekDay!, day: weekDay == 6 ? null : 6),
                        //   InactiveRewardWidget(disable: 7 < weekDay!, coming: 7 > weekDay!, day: weekDay == 7 ? null : 7),
                        //   // RewardWidget(),
                        //   // ComingRewardWidget(),
                        //   // ComingRewardWidget(),
                        // ],
                        children: List.generate(
                          7,
                          (index) {
                            if (index == 6)
                              coin = 500;
                            else
                              coin = coin + 50;
                            return InactiveRewardWidget(
                              disable: index + 1 < weekDay!,
                              coming: index + 1 > weekDay!,
                              day: weekDay == index + 1 ? null : index + 1,
                              coin: coin,
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 22.h,
                      ),
                      ref.watch(homeViewModel).claimStatusObj == null
                          ? Container()
                          : todayDateString == lastClaimDateString
                              ? Center(
                                  child: Text(
                                    "You've checked in today  🎉",
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      color: kRewardBg,
                                    ),
                                  ),
                                )
                              : ElevatedButton(
                                  onPressed: () {
                                    ref.read(homeViewModel).claimDailyBonus(ref);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: Size(double.infinity, 48.h),
                                    backgroundColor: Color(0xFFFFFCF8),
                                  ),
                                  child: Text(
                                    "Check-in Now",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13.sp,
                                      color: kLoyaltyPointText,
                                    ),
                                  ),
                                ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 12.h,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Another Way to Get Points",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      // TextButton(
                      //   onPressed: () {},
                      //   style: TextButton.styleFrom(
                      //     padding: EdgeInsets.zero,
                      //     tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      //     minimumSize: Size.zero,
                      //   ),
                      //   child: Text(
                      //     "See All",
                      //     style: TextStyle(
                      //       fontSize: 13.sp,
                      //       fontWeight: FontWeight.w500,
                      //       color: kBlueTextBtn,
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                  SizedBox(
                    height: 18.h,
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
                                padding: EdgeInsets.symmetric(vertical: 20.h),
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ComingRewardWidget extends StatelessWidget {
  const ComingRewardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 9.h),
      decoration: BoxDecoration(
        color: kRewardBg.withOpacity(0.5),
        // border: Border.all(color: kRewardBg),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(
                Assets.rewardCoin,
              ),
              Text(
                "50",
                style: TextStyle(
                  fontSize: 7.sp,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFFFFF3D1).withOpacity(0.6),
                ),
              ),
            ],
          ),
          Text(
            "Day 1",
            style: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.w400,
              color: Color(0xFF475467).withOpacity(0.6),
            ),
          ),
        ],
      ),
    );
  }
}

class InactiveRewardWidget extends StatelessWidget {
  InactiveRewardWidget({
    super.key,
    required this.disable,
    required this.coming,
    this.coin,
    this.day,
  });
  final bool disable;
  final bool coming;
  final int? day;
  final int? coin;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 8.h),
      decoration: coming
          ? BoxDecoration(
              color: kRewardBg.withOpacity(0.5),
              // border: Border.all(color: kRewardBg),
              borderRadius: BorderRadius.circular(8.r),
            )
          : disable
              ? BoxDecoration(
                  color: kRewardBg.withOpacity(0.7),
                  border: Border.all(color: kRewardBg),
                  borderRadius: BorderRadius.circular(8.r),
                )
              : BoxDecoration(
                  color: kRewardBg,
                  borderRadius: BorderRadius.circular(8.r),
                ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(
                Assets.rewardCoin,
              ),
              Text(
                "$coin",
                style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w800,
                  color: coming
                      ? Color(0xFFFFF3D1).withOpacity(0.6)
                      : disable
                          ? Color(0xFFFFF3D1)
                          : Color(0xFFFFF3D1),
                ),
              ),
            ],
          ),
          Text(
            day == null ? "Today" : "Day $day",
            style: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.w400,
              color: coming
                  ? Color(0xFF475467).withOpacity(0.6)
                  : disable
                      ? Color(0xFF475467)
                      : kLoyaltyPointText,
            ),
          ),
        ],
      ),
    );
  }
}

class RewardWidget extends StatelessWidget {
  const RewardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 9.h),
      decoration: BoxDecoration(
        color: kRewardBg,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(
                Assets.rewardCoin,
              ),
              Text(
                "+ 50",
                style: TextStyle(
                  fontSize: 7.sp,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFFFFF3D1),
                ),
              ),
            ],
          ),
          Text(
            "Today",
            style: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.w400,
              color: kLoyaltyPointText,
            ),
          ),
        ],
      ),
    );
  }
}

// import 'package:cedratools/helper/assets.dart';
// import 'package:cedratools/helper/colors.dart';
// import 'package:cedratools/view_models/home_view_model.dart';
// import 'package:cedratools/widgets/wish_list_product_item.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:intl/intl.dart';

// class RewardView extends ConsumerStatefulWidget {
//   const RewardView({super.key});

//   @override
//   RewardViewState createState() => RewardViewState();
// }

// class RewardViewState extends ConsumerState<RewardView> {
//   int? weekDay;
//   String? lastClaimDateString;
//   late String todayDateString;
//   DateTime todayDate = DateTime.now();
//   @override
//   void initState() {
//     weekDay = todayDate.weekday;
//     getTodayDateString();
//     getClaimStatus();
//     super.initState();
//   }

//   void getClaimStatus() async {
//     DateTime? lastClaimDate;
//     await ref.read(homeViewModel).checkClaimStatus();
//     String? date = ref.read(homeViewModel).claimStatusObj?.lastClaimDate;
//     if (date != null) {
//       lastClaimDate = DateFormat("yyyy-MM-dd").parse(date);
//       lastClaimDateString = DateFormat('yyyy-MM-dd').format(lastClaimDate);
//     }
//   }

//   void getTodayDateString() {
//     todayDateString = DateFormat('yyyy-MM-dd').format(todayDate);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Stack(
//               children: [
//                 Container(
//                   width: double.infinity,
//                   height: 520.h,
//                   decoration: BoxDecoration(
//                     image: DecorationImage(
//                       image: AssetImage(Assets.rewardBg),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   bottom: 0,
//                   left: 0,
//                   right: 0,
//                   child: Container(
//                     padding: EdgeInsets.all(16.r),
//                     margin: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 50.h),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(16.r),
//                       gradient: LinearGradient(
//                         begin: Alignment.centerRight,
//                         end: Alignment.centerLeft,
//                         colors: [
//                           Color(0xFFFFB24A),
//                           Color(0xFFEE8F0F),
//                         ],
//                       ),
//                       border: Border.all(
//                         color: Color(0xFFFFF4E6),
//                       ),
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Text(
//                           "Daily check-in Progress",
//                           style: TextStyle(
//                             fontSize: 16.sp,
//                             fontWeight: FontWeight.w600,
//                             color: Colors.white,
//                           ),
//                         ),
//                         SizedBox(
//                           height: 6.h,
//                         ),
//                         Text(
//                           "You will get extra points in the seventh time you check in each week.",
//                           style: TextStyle(
//                             fontSize: 12.sp,
//                             fontWeight: FontWeight.w400,
//                             color: Color(0xFFFFF4E6),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 30.h,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             InactiveRewardWidget(disable: 1 < weekDay!, coming: 1 > weekDay!, day: weekDay == 1 ? null : 1),
//                             InactiveRewardWidget(disable: 2 < weekDay!, coming: 2 > weekDay!, day: weekDay == 2 ? null : 2),
//                             InactiveRewardWidget(disable: 3 < weekDay!, coming: 3 > weekDay!, day: weekDay == 3 ? null : 3),
//                             InactiveRewardWidget(disable: 4 < weekDay!, coming: 4 > weekDay!, day: weekDay == 4 ? null : 4),
//                             InactiveRewardWidget(disable: 5 < weekDay!, coming: 5 > weekDay!, day: weekDay == 5 ? null : 5),
//                             InactiveRewardWidget(disable: 6 < weekDay!, coming: 6 > weekDay!, day: weekDay == 6 ? null : 6),
//                             InactiveRewardWidget(disable: 7 < weekDay!, coming: 7 > weekDay!, day: weekDay == 7 ? null : 7),
//                             // RewardWidget(),
//                             // ComingRewardWidget(),
//                             // ComingRewardWidget(),
//                           ],
//                         ),
//                         SizedBox(
//                           height: 22.h,
//                         ),
//                         ref.watch(homeViewModel).claimStatusObj == null
//                             ? Container()
//                             : todayDateString == lastClaimDateString
//                                 ? Center(
//                                     child: Text(
//                                       "You've checked in today  🎉",
//                                       style: TextStyle(
//                                         fontSize: 13.sp,
//                                         color: kRewardBg,
//                                       ),
//                                     ),
//                                   )
//                                 : ElevatedButton(
//                                     onPressed: () {
//                                       ref.read(homeViewModel).claimDailyBonus(ref);
//                                     },
//                                     style: ElevatedButton.styleFrom(
//                                       minimumSize: Size(double.infinity, 48.h),
//                                       backgroundColor: Color(0xFFFFFCF8),
//                                     ),
//                                     child: Text(
//                                       "Check-in Now",
//                                       style: TextStyle(
//                                         fontWeight: FontWeight.w500,
//                                         fontSize: 13.sp,
//                                         color: kLoyaltyPointText,
//                                       ),
//                                     ),
//                                   ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: 12.h,
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 20.w),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         "Another Way to Get Points",
//                         style: TextStyle(
//                           fontSize: 14.sp,
//                           fontWeight: FontWeight.w600,
//                           color: Colors.black,
//                         ),
//                       ),
//                       TextButton(
//                         onPressed: () {},
//                         style: TextButton.styleFrom(
//                           padding: EdgeInsets.zero,
//                           tapTargetSize: MaterialTapTargetSize.shrinkWrap,
//                           minimumSize: Size.zero,
//                         ),
//                         child: Text(
//                           "See All",
//                           style: TextStyle(
//                             fontSize: 13.sp,
//                             fontWeight: FontWeight.w500,
//                             color: kBlueTextBtn,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 18.h,
//                   ),
//                   // GridView.count(
//                   //   shrinkWrap: true,
//                   //   physics: NeverScrollableScrollPhysics(),
//                   //   padding: EdgeInsets.zero,
//                   //   crossAxisSpacing: 20.h,
//                   //   mainAxisSpacing: 32.h,
//                   //   childAspectRatio: 0.7,
//                   //   crossAxisCount: 2,
//                   //   children: List.generate(
//                   //     6,
//                   //     (index) {
//                   //       return WishListProductItem();
//                   //     },
//                   //   ),
//                   // ),
//                   SizedBox(
//                     height: 30.h,
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ComingRewardWidget extends StatelessWidget {
//   const ComingRewardWidget({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 9.h),
//       decoration: BoxDecoration(
//         color: kRewardBg.withOpacity(0.5),
//         // border: Border.all(color: kRewardBg),
//         borderRadius: BorderRadius.circular(8.r),
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Stack(
//             alignment: Alignment.center,
//             children: [
//               SvgPicture.asset(
//                 Assets.rewardCoin,
//               ),
//               Text(
//                 "+ 50",
//                 style: TextStyle(
//                   fontSize: 7.sp,
//                   fontWeight: FontWeight.w800,
//                   color: Color(0xFFFFF3D1).withOpacity(0.6),
//                 ),
//               ),
//             ],
//           ),
//           Text(
//             "Day 1",
//             style: TextStyle(
//               fontSize: 10.sp,
//               fontWeight: FontWeight.w400,
//               color: Color(0xFF475467).withOpacity(0.6),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class InactiveRewardWidget extends StatelessWidget {
//   InactiveRewardWidget({
//     super.key,
//     required this.disable,
//     required this.coming,
//     this.day,
//   });
//   final bool disable;
//   final bool coming;
//   final int? day;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 8.h),
//       decoration: coming
//           ? BoxDecoration(
//               color: kRewardBg.withOpacity(0.5),
//               // border: Border.all(color: kRewardBg),
//               borderRadius: BorderRadius.circular(8.r),
//             )
//           : disable
//               ? BoxDecoration(
//                   color: kRewardBg.withOpacity(0.7),
//                   border: Border.all(color: kRewardBg),
//                   borderRadius: BorderRadius.circular(8.r),
//                 )
//               : BoxDecoration(
//                   color: kRewardBg,
//                   borderRadius: BorderRadius.circular(8.r),
//                 ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Stack(
//             alignment: Alignment.center,
//             children: [
//               SvgPicture.asset(
//                 Assets.rewardCoin,
//               ),
//               Text(
//                 "+ 50",
//                 style: TextStyle(
//                   fontSize: 7.sp,
//                   fontWeight: FontWeight.w800,
//                   color: coming
//                       ? Color(0xFFFFF3D1).withOpacity(0.6)
//                       : disable
//                           ? Color(0xFFFFF3D1)
//                           : Color(0xFFFFF3D1),
//                 ),
//               ),
//             ],
//           ),
//           Text(
//             day == null ? "Today" : "Day $day",
//             style: TextStyle(
//               fontSize: 10.sp,
//               fontWeight: FontWeight.w400,
//               color: coming
//                   ? Color(0xFF475467).withOpacity(0.6)
//                   : disable
//                       ? Color(0xFF475467)
//                       : kLoyaltyPointText,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class RewardWidget extends StatelessWidget {
//   const RewardWidget({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 9.h),
//       decoration: BoxDecoration(
//         color: kRewardBg,
//         borderRadius: BorderRadius.circular(8.r),
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Stack(
//             alignment: Alignment.center,
//             children: [
//               SvgPicture.asset(
//                 Assets.rewardCoin,
//               ),
//               Text(
//                 "+ 50",
//                 style: TextStyle(
//                   fontSize: 7.sp,
//                   fontWeight: FontWeight.w800,
//                   color: Color(0xFFFFF3D1),
//                 ),
//               ),
//             ],
//           ),
//           Text(
//             "Today",
//             style: TextStyle(
//               fontSize: 10.sp,
//               fontWeight: FontWeight.w400,
//               color: kLoyaltyPointText,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
