// ignore_for_file: must_be_immutable

import 'package:cedratools/helper/app_routes.dart';
import 'package:cedratools/helper/base_helper.dart';
import 'package:cedratools/helper/colors.dart';
import 'package:cedratools/view_models/auth_view_model.dart';
import 'package:cedratools/view_models/locale_viewmodel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum SelectLanguage { english, spanish }

class AccountTab extends ConsumerWidget {
  AccountTab({super.key});
  SelectLanguage? language = SelectLanguage.english;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var localeRefWatch = ref.watch(localelProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          onTap: () {
            Navigator.pushNamed(context, AppRoutes.EDIT_PROFILE_VIEW);
          },
          leading: Icon(Icons.person, color: kPrimaryColor),
          title: Text(
            "Edit Profile",
            // "${AppLocalizations.of(BaseHelper.navState.currentContext!)!.what_was_the_first_sport}",
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
              color: kPrimaryColor,
            ),
          ),
        ),
        ListTile(
          onTap: () {
            Navigator.pushNamed(context, AppRoutes.CHANGE_PASSWORD_VIEW);
          },
          leading: Icon(Icons.lock, color: kPrimaryColor),
          title: Text(
            "Change Password",
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
              color: kPrimaryColor,
            ),
          ),
        ),
        ListTile(
          onTap: () {
            BaseHelper.launchURL(BaseHelper.privacyPolicy);
          },
          leading: Icon(Icons.privacy_tip, color: kPrimaryColor),
          title: Text(
            "Privacy",
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
              color: kPrimaryColor,
            ),
          ),
        ),
        ListTile(
          onTap: () {
            showBottomSheet(
                elevation: 3.0,
                // backgroundColor: Colors.white60,
                context: context,
                builder: (context) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 8.h,
                      ),
                      Container(
                        height: 5.h,
                        width: 50.w,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        "Choose Language",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: kPrimaryColor,
                        ),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      ListTile(
                        title: Text('English'),
                        leading: Radio<SelectLanguage>(
                          fillColor: MaterialStateColor.resolveWith((states) {
                            if (states.contains(MaterialState.selected)) {
                              return kPrimaryColor;
                            }
                            return kInactiveTabIcon;
                          }),
                          value: SelectLanguage.english,
                          groupValue: language,
                          onChanged: (SelectLanguage? value) {
                            language = value;
                            localeRefWatch.setLocale(Locale("en"));
                            Navigator.pop(context);
                          },
                        ),
                        onTap: () {
                          language = SelectLanguage.english;
                          localeRefWatch.setLocale(Locale("en"));
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        title: Text('Spanish'),
                        leading: Radio<SelectLanguage>(
                          fillColor: MaterialStateColor.resolveWith((states) {
                            if (states.contains(MaterialState.selected)) {
                              return kPrimaryColor;
                            }
                            return kInactiveTabIcon;
                          }),
                          value: SelectLanguage.spanish,
                          groupValue: language,
                          onChanged: (SelectLanguage? value) {
                            language = value;
                            localeRefWatch.setLocale(Locale("es"));
                            Navigator.pop(context);
                          },
                        ),
                        onTap: () {
                          language = SelectLanguage.spanish;
                          localeRefWatch.setLocale(Locale("es"));
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  );
                });
          },
          leading: Icon(Icons.language, color: kPrimaryColor),
          title: Text(
            "Language",
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
              color: kPrimaryColor,
            ),
          ),
          subtitle: Text("${language!.name}"),
        ),
        ListTile(
          onTap: () {
            ref.read(authControllerProvider).logout(context);
          },
          leading: Icon(Icons.logout, color: kPrimaryColor),
          title: Text(
            "Logout",
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
              color: kPrimaryColor,
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.delete_forever, color: kPrimaryColor),
          onTap: () {
            ref.read(authControllerProvider).deleteAccount(ref, context);
          },
          title: Text(
            "Deactivate Account",
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
              color: kPrimaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
