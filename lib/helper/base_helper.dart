import 'package:cedratools/helper/colors.dart';
import 'package:flutter/material.dart';

class BaseHelper {
  static final GlobalKey<NavigatorState> navState = GlobalKey<NavigatorState>();
  static void showSnackBar(BuildContext context, String value, {required bool isError}) {
    SnackBar snackBar = SnackBar(
      content: Text("$value"),
      duration: Duration(seconds: 2),
      backgroundColor: isError ? kOff.withOpacity(0.7) : kPrimaryColor,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
