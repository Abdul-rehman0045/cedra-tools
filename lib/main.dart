import 'package:cedratools/views/cart_view.dart';
import 'package:cedratools/views/complete_profile_view.dart';
import 'package:cedratools/views/contact_us_view.dart';
import 'package:cedratools/views/email_view.dart';
import 'package:cedratools/views/forget_password_view.dart';
import 'package:cedratools/views/homepage/home_view.dart';
import 'package:cedratools/views/password_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(MyApp());
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
        theme: ThemeData(
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: CartView(),
      ),
    );
  }
}
