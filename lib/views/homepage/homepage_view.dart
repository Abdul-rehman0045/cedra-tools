import 'package:cedratools/helper/assets.dart';
import 'package:cedratools/helper/colors.dart';
import 'package:cedratools/views/contact_us_view.dart';
import 'package:cedratools/views/homepage/tabs/account_tab.dart';
import 'package:cedratools/views/homepage/tabs/catalog_tab.dart';
import 'package:cedratools/views/homepage/tabs/home_tab.dart';
import 'package:cedratools/views/reward_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomepageView extends StatefulWidget {
  const HomepageView({super.key});

  @override
  State<HomepageView> createState() => _HomepageViewState();
}

class _HomepageViewState extends State<HomepageView> {
  final _advancedDrawerController = AdvancedDrawerController();
  int currentIndex = 0;
  // List pages = [
  //   HomeTab(controller: _advancedDrawerController),
  //   CatalogTab(),
  //   AccountTab(),
  // ];
  List pages = [];

  @override
  void initState() {
    pages.add(HomeTab(controller: _advancedDrawerController));
    pages.add(CatalogTab());
    pages.add(AccountTab());
    // pages[0] = HomeTab(controller: _advancedDrawerController);
    // pages[1] = CatalogTab();
    // pages[2] = AccountTab();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   bottomNavigationBar: bottomNavigationBar(),
    //   body: pages[currentIndex],
    // );
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
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RewardView(),
                    ),
                  );
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
                onTap: () {},
                title: Text(
                  'About Us',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ),
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
          "Catalog",
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
