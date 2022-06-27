import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/localization/language.dart';
import '../../../common/widget/shered_preferences.dart';
import '../../../common/widget/theme_provider.dart';
import '../models/settings.dart';

class SwitchWidget extends StatefulWidget {
  SwitchWidget({Key? key}) : super(key: key);

  @override
  State<SwitchWidget> createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
  final _preferencesService = PreferencesServis();
  @override
  void initState() {
    super.initState();
    _popFilds();
  }

  var _themeToggle = true;
  Language dropdownValue = Language.english;

  void _popFilds() async {
    final settings = await _preferencesService.getSettings();
    setState(() {
      dropdownValue = settings.lenguage;
      _themeToggle = settings.themeToggle;
      _setTheme(_themeToggle);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: _themeToggle,
      onChanged: (bool newValue) {
        setState(
          () {
            _setTheme(newValue);
            _saveSettings();
            _themeToggle = newValue;
          },
        );
      },
    );
  }

  void _saveSettings() {
    final newSettings = Settings(
      lenguage: dropdownValue,
      themeToggle: _themeToggle,
    );
    _preferencesService.saveSettings(newSettings);
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
