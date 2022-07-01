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
  Future<bool> _setBool() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    final String theme = _prefs.getString('theme')!;
    if (theme == 'darkTheme') {
      return true;
    } else {
      return false;
    }
  }

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _setBool(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Switch(
            value: snapshot.data ?? false,
            onChanged: (bool newValue) {
              setState(
                () {
                  _setTheme(newValue);
                },
              );
            },
          );
        }
        return Center(child: CircularProgressIndicator());
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
