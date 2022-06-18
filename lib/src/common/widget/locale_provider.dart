import 'package:flutter/cupertino.dart';
import 'package:park_app/l10n/l10n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:park_app/src/common/widget/locale_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

class LocaleProvider extends ChangeNotifier {
  Locale _locale = new Locale('en');

  Locale get locale => _locale;

  void setLocale(Locale locale) {
    if (!L10n.all.contains(locale)) return;

    _locale = locale;
    notifyListeners();
  }

  //void clearLocale() {
  //  _locale = null;
  //  notifyListeners();
  //}
}
