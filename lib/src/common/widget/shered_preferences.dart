import 'dart:async';
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:park_app/src/common/localization/language.dart';
import 'package:park_app/src/common/localization/language.dart';

import '../../feature/settings/models/settings.dart';
import '../../feature/settings/widget/settings_screen.dart';

class PreferencesServis {
  Future saveSettings(Settings settings) async {
    final preferences = await SharedPreferences.getInstance();

    await preferences.setInt('lenguage', settings.lenguage.index);
    await preferences.setBool('_themeToggle', settings.themeToggle);
  }

  Future<Settings> getSettings() async {
    final preferences = await SharedPreferences.getInstance();
    final lenguage = Language.values[preferences.getInt('lenguage') ?? 0];
    final themeToggle = preferences.getBool('_themeToggle');

    return Settings(lenguage, themeToggle!);
  }
}
