import 'package:cedratools/helper/app_fonts.dart';
import 'package:cedratools/helper/app_routes.dart';
import 'package:cedratools/views/cart_view.dart';
import 'package:cedratools/views/complete_profile_view.dart';
import 'package:cedratools/views/contact_us_view.dart';
import 'package:cedratools/views/email_view.dart';
import 'package:cedratools/views/filter_view.dart';
import 'package:cedratools/views/forget_password_view.dart';
import 'package:cedratools/views/homepage/homepage_view.dart';
import 'package:cedratools/views/password_view.dart';
import 'package:cedratools/views/reward_view.dart';
import 'package:cedratools/views/wish_list_view.dart';
import 'package:cedratools/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(390, 1234),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRoutes.getRoute,
        builder: (context, child) {
          return Loader(
            child: MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: child!,
            ),
          );
        },
        theme: ThemeData(
          fontFamily: AppFonts.MONTSERRAT,
          useMaterial3: true,
        ),
        // home: EmailView(),
        initialRoute: AppRoutes.EMAIL_VIEW,
      ),
    );
  }
}
