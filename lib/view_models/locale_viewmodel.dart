import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
 
var localelProvider = ChangeNotifierProvider<LocaleProvider>((ref) => LocaleProvider());

class LocaleProvider extends ChangeNotifier {
  Locale _locale = Locale("en");
  Locale get locale => _locale;
  void setLocale(Locale locale) {
    if (!AppLocalizations.supportedLocales.contains(locale)) return;
    _locale = locale;
    notifyListeners();
  }
}
