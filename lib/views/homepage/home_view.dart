import 'package:cedratools/helper/assets.dart';
import 'package:cedratools/helper/colors.dart';
import 'package:cedratools/views/homepage/tabs/account_tab.dart';
import 'package:cedratools/views/homepage/tabs/catalog_tab.dart';
import 'package:cedratools/views/homepage/tabs/home_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;
  List pages = [
    HomeTab(),
    CatalogTab(),
    AccountTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNavigationBar(),
      body: pages[currentIndex],
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
