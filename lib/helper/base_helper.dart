import 'package:cedratools/helper/assets.dart';
import 'package:cedratools/helper/colors.dart';
import 'package:cedratools/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class BaseHelper {
  static final GlobalKey<NavigatorState> navState = GlobalKey<NavigatorState>();

  static const String facebookUrl = "https://www.facebook.com/cedra.tools.9";
  static const String instagramUrl = "https://www.instagram.com/cedratools";
  static const String twitterUrl = "https://x.com/CedraTools";
  static const String youtubeUrl = "https://www.youtube.com/CedTools";

  static const String email = "cedratools@cedratools.com";
  static const String phoneNumber = "+52 55 8502 3602";
  static const LatLng coordinates = LatLng(19.306110212354945, -99.20045441349329);
  static const String address = "Pedregal del Lago shopping center. Level 3 - Local 3. Road to Santa Teresa #13, Tlalpan Extension. Fuentes del Pedregal, 14110 Mexico City, CDMX";
  static const String privacyPolicy = "https://escaner-automotriz.com.mx/pages/aviso-de-privacidad";

  static void showSnackBar(BuildContext context, String value, {required bool isError}) {
    SnackBar snackBar = SnackBar(
      content: Text("$value"),
      duration: Duration(seconds: 2),
      backgroundColor: isError ? kOff.withOpacity(0.7) : kPrimaryColor,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  //url launcher
  static void launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      print('Could not launch $url');
    }
  }

  //launch email
  static void launchEmail(String email) async {
    if (await canLaunchUrl(Uri.parse("mailto:$email"))) {
      await launchUrl(Uri.parse("mailto:$email"));
    } else {
      print('Could not launch $email');
    }
  }

  //launch phone
  static void launchPhone(String phone) async {
    if (await canLaunchUrl(Uri.parse("tel:$phone"))) {
      await launchUrl(Uri.parse("tel:$phone"));
    } else {
      print('Could not launch $phone');
    }
  }

  //launch whatsapp
  static void launchWhatsApp(String phone) async {
    if (await canLaunchUrl(Uri.parse("https://wa.me/$phone"))) {
      await launchUrl(Uri.parse("https://wa.me/$phone"));
    } else {
      print('Could not launch $phone');
    }
  }

  // create a cusotm dialog to show a message that will be having an icon of coins, a title and description for coins in golfer color and then a okay button, show every widget in a column
  static void showCoinsDialog(BuildContext context, String title, String description) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(Assets.coinsBox),
                SizedBox(height: 10),
                Text(
                  "$title",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w600,
                    color: kPrimaryColor,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //horizontal line
                    Container(
                      height: 1.5,
                      width: 30,
                      color: kLoyaltyPointText,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "$description",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: kLoyaltyPointText,
                      ),
                    ),
                    SizedBox(width: 10),
                    //horizontal line
                    Container(
                      height: 1.5,
                      width: 30,
                      color: kLoyaltyPointText,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                CustomElevatedButton(
                  text: "Continue",
                  backgroundColor: kPrimaryColor,
                  height: 40.w,
                  width: 100.w,
                  onPressed: () async {
                    //pop
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
