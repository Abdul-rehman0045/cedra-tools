import 'dart:io';

import 'package:cedratools/firebase_options.dart';
import 'package:cedratools/helper/app_fonts.dart';
import 'package:cedratools/helper/app_routes.dart';
import 'package:cedratools/helper/base_helper.dart';
import 'package:cedratools/view_models/locale_viewmodel.dart';
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
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

late Box box;

void main() async {
  await init();

  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

Future init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: Platform.isIOS ? null : DefaultFirebaseOptions.currentPlatform);

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  await initHive();
}

Future initHive() async {
  await Hive.initFlutter();
  box = await Hive.openBox('cedratools');
}

class MyApp extends ConsumerWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenUtilInit(
      designSize: Size(390, 1234),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        navigatorKey: BaseHelper.navState,
        debugShowCheckedModeBanner: false,
        locale: ref.watch(localelProvider).locale,
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('en'), // English
          Locale('es'), // Spanish
        ],
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
          scaffoldBackgroundColor: Colors.white,
          fontFamily: AppFonts.MONTSERRAT,
          useMaterial3: true,
        ),
        initialRoute: box.get("token", defaultValue: null) == null ? AppRoutes.EMAIL_VIEW : AppRoutes.HOME_PAGE_VIEW,
      ),
    );
  }
}
