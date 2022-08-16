import 'package:flutter/material.dart';
import 'package:park_app/src/common/localization/language.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleProvider extends ChangeNotifier {
  LocaleProvider([Language? language]) : _language = language ?? Language.english;
  Language _language;

  Future<void> getLocale() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    _language = Language.values[prefs.getInt('lenguage') ?? 0];
  }

  Language get language => _language;
  Locale get locale {
    getLocale();
    return _language.locale;
  }

  void setLocale(Language language) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    _language = language;
    prefs.setInt('lenguage', _language.index);
    notifyListeners();
  }
}
