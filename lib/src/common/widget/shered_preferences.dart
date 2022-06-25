import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:park_app/src/common/localization/language.dart';

import '../../feature/settings/models/settings.dart';

class PreferencesServis {
  void saveSettings(Settings settings) async {
    final preferences = await SharedPreferences.getInstance();

    await preferences.setInt('lenguage', settings.lenguage.index);
    await preferences.setBool('themeToggle', settings.themeToggle);
  }

  Future<Settings> getSettings() async {
    final preferences = await SharedPreferences.getInstance();
    final lenguage = Language.values[preferences.getInt('lenguage') ?? 0];
    final themeToggle = preferences.getBool('themeToggle');

    return Settings(lenguage: lenguage, themeToggle: themeToggle!);
  }
}
