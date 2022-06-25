import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:park_app/src/common/widget/shered_preferences.dart';
import 'package:park_app/src/common/widget/theme_provider.dart';
import 'package:provider/provider.dart';

import '../../../common/localization/l10n.dart';
import '../../../common/localization/language.dart';
import '../models/settings.dart';
import 'drop_down_menu.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final _preferencesService = PreferencesServis();
  var _themeToggle = false;
  Language dropdownValue = Language.english;

  @override
  void initState() {
    super.initState();
    _popFilds();
  }

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        title: Text(AppLocalizations.of(context)!.settings),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              height: 50,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.language),
                    Text(
                      Localized.current.leng,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: DropDownMenu(dropdownValue: dropdownValue),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              height: 50,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Row(
                    children: [
                      const Icon(Icons.light_mode), // add chenging icon dep on theme
                      Text(
                        AppLocalizations.of(context)!.theme,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 5),
                        child: Switch(
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
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _saveSettings() {
    final newSettings = Settings(lenguage: dropdownValue, themeToggle: _themeToggle);
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
