import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../common/localization/language.dart';
import '../../../common/widget/theme_provider.dart';
import '../models/settings.dart';

class SwitchWidget extends StatefulWidget {
  const SwitchWidget({Key? key}) : super(key: key);

  @override
  State<SwitchWidget> createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late bool _themeToggle;

  Future<void> _setBool() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();

    if (_prefs.getString('theme') == 'ThemeData#ab495') {
      _themeToggle = true;
    } else {
      _themeToggle = false;
    }
  }

  @override
  void initState() {
    super.initState();
    _setBool();
  }

  bool trigger = false;

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: trigger,
      onChanged: (bool newValue) {
        setState(
          () {
            trigger = newValue;
            _setTheme(newValue);
          },
        );
      },
    );
  }

  void _setTheme(newValue) async {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    if (newValue == false) {
      await _prefs.setString('theme', 'lightTheme');
      themeProvider.setTheme(ThemeProvider.lightTheme);
    } else {
      await _prefs.setString('theme', 'darkTheme');
      themeProvider.setTheme(ThemeProvider.darkTheme);
    }
  }
}
