import 'package:flutter/material.dart';

import '../localization/language.dart';

class LocaleProvider extends ChangeNotifier {
  LocaleProvider([Language? language]) : _language = language ?? Language.english;
  Language _language;

  Language get language => _language;
  Locale get locale => _language.locale;

  void setLocale(Language language) {
    _language = language;
    notifyListeners();
  }

  //void clearLocale() {
  //  _locale = null;
  //  notifyListeners();
  //}
}
