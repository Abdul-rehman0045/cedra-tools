import 'package:cedratools/helper/app_routes.dart';
import 'package:cedratools/helper/assets.dart';
import 'package:cedratools/helper/base_helper.dart';
import 'package:cedratools/helper/colors.dart';
import 'package:cedratools/view_models/cart_view_model.dart';
import 'package:cedratools/views/contact_us_view.dart';
import 'package:cedratools/views/homepage/tabs/account_tab.dart';
import 'package:cedratools/views/homepage/tabs/catalogue_tab.dart';
import 'package:cedratools/views/homepage/tabs/home_tab.dart';
import 'package:cedratools/views/reward_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomepageView extends ConsumerStatefulWidget {
  final dynamic map;
  HomepageView({super.key, required this.map});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomepageViewState();
}

class _HomepageViewState extends ConsumerState<HomepageView> {
  final _advancedDrawerController = AdvancedDrawerController();
  int currentIndex = 0;
  List pages = [];

  @override
  void initState() {
    pages.add(HomeTab(controller: _advancedDrawerController));
    pages.add(CatalogueTab());
    pages.add(AccountTab());

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (widget.map != null && widget.map) {
        BaseHelper.showCoinsDialog(context, "Congratulations!\nyou won", "100 coins");
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var refCartWatch = ref.watch(cartViewModel);

    return AdvancedDrawer(
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: kPrimaryColor,
        ),
      ),
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      openRatio: 0.65.w,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: InkWell(
            onTap: () {
              _advancedDrawerController.showDrawer();
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
        bottomNavigationBar: bottomNavigationBar(),
        body: pages[currentIndex],
      ),
      drawer: SafeArea(
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                height: 150.h,
              ),
              ListTile(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.REWARD_VIEW,
                  );
                  _advancedDrawerController.hideDrawer();
                },
                title: Text(
                  'Get Rewards',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ContactUsView(),
                    ),
                  );
                },
                title: Text(
                  'Contact Us',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ),
              // ListTile(
              //   onTap: () {},
              //   title: Text(
              //     'Location',
              //     style: TextStyle(
              //       fontSize: 16.sp,
              //       fontWeight: FontWeight.w400,
              //       color: Colors.white,
              //     ),
              //   ),
              // ),

              // ListTile(
              //   onTap: () {},
              //   title: Text(
              //     'About Us',
              //     style: TextStyle(
              //       fontSize: 16.sp,
              //       fontWeight: FontWeight.w400,
              //       color: Colors.white,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      elevation: 0,
      selectedItemColor: kPrimaryColor,
      unselectedItemColor: kInactiveTabIcon,
      backgroundColor: Colors.white,
      selectedFontSize: 12.sp,
      unselectedFontSize: 12.sp,
      items: <BottomNavigationBarItem>[
        bottomNavigationBarItem(
          Assets.homeIcon,
          "Home",
        ),
        bottomNavigationBarItem(
          Assets.catalogIcon,
          "Catalogue",
        ),
        bottomNavigationBarItem(
          Assets.accountIcon,
          "Account",
        ),
      ],
      currentIndex: currentIndex,
      onTap: (int index) {
        setState(() {
          currentIndex = index;
        });
      },
    );
  }

  BottomNavigationBarItem bottomNavigationBarItem(img, label) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        img,
        color: kInactiveTabIcon,
      ),
      activeIcon: SvgPicture.asset(
        img,
        color: kPrimaryColor,
      ),
      label: label,
    );
  }
}
