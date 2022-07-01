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
  late Future<bool> _themeToggle;

  Future<void> _setBool(value) async {
    final SharedPreferences prefs = await _prefs;
    final bool themeToggle = prefs.getBool('_themeToggle') ?? false;
    prefs.setBool('_themeToggle', themeToggle);
  }

  @override
  void initState() {
    super.initState();
    _themeToggle = _prefs.then(
      (SharedPreferences prefs) {
        return prefs.getBool('_themeToggle') ?? false;
      },
    );
  }

  bool trigger = false;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _themeToggle,
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) => Switch(
        value: trigger,
        onChanged: (bool newValue) {
          setState(
            () {
              trigger = newValue;
              _setBool(newValue);
              _setTheme(newValue);
            },
          );
        },
      ),
    );
  }

  void _setTheme(newValue) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    if (newValue == false) {
      themeProvider.setTheme(ThemeProvider.lightTheme);
    } else {
      themeProvider.setTheme(ThemeProvider.darkTheme);
    }
  }
}
