import 'package:cedratools/helper/assets.dart';
import 'package:cedratools/helper/colors.dart';
import 'package:cedratools/widgets/wish_list_product_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class RewardView extends StatelessWidget {
  const RewardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
                    margin: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 50.h),
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
                          children: [
                            InactiveRewardWidget(),
                            InactiveRewardWidget(),
                            InactiveRewardWidget(),
                            InactiveRewardWidget(),
                            RewardWidget(),
                            ComingRewardWidget(),
                            ComingRewardWidget(),
                          ],
                        ),
                        SizedBox(
                          height: 22.h,
                        ),
                        ElevatedButton(
                          onPressed: () {},
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
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
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          minimumSize: Size.zero,
                        ),
                        child: Text(
                          "See All",
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                            color: kBlueTextBtn,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  GridView.count(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    crossAxisSpacing: 20.h,
                    mainAxisSpacing: 32.h,
                    childAspectRatio: 0.7,
                    crossAxisCount: 2,
                    children: List.generate(
                      6,
                      (index) {
                        return WishListProductItem();
                      },
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                ],
              ),
            ),
          ],
        ),
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
                "+ 50",
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
  const InactiveRewardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 9.h),
      decoration: BoxDecoration(
        color: kRewardBg.withOpacity(0.7),
        border: Border.all(color: kRewardBg),
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
            "Day 1",
            style: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.w400,
              color: Color(0xFF475467),
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
