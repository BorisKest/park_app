import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:park_app/src/common/widget/locale_provider.dart';
import 'package:park_app/src/common/widget/theme_provider.dart';
import 'package:provider/provider.dart';

import '../../../common/localization/l10n.dart';
import '../../../common/localization/language.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool state = true;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
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
                    const DropDownMenu(),
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
                  padding: EdgeInsets.only(left: 5),
                  child: Row(
                    children: [
                      const Icon(Icons.light_mode), // add chenging icon dep on theme
                      Text(
                        AppLocalizations.of(context)!.theme,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 5),
                        child: Switch(
                          value: state,
                          onChanged: (bool s) {
                            setState(() {
                              if (s == false) {
                                themeProvider.setTheme(ThemeProvider.lightTheme);
                              } else {
                                themeProvider.setTheme(ThemeProvider.darkTheme);
                              }
                              state = s;
                            });
                          },
                        ),
                      )
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
}

class DropDownMenu extends StatefulWidget {
  const DropDownMenu({Key? key}) : super(key: key);

  @override
  State<DropDownMenu> createState() => _DropDownMenuState();
}

class _DropDownMenuState extends State<DropDownMenu> {
  Language _dropdownValue = Language.english;

  @override
  void initState() {
    super.initState();
    _dropdownValue = Provider.of<LocaleProvider>(context, listen: false).language;
    //dropdownValue
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<Language>(
      value: _dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 10,
      style: const TextStyle(
        color: Colors.blue,
      ),
      onChanged: (Language? locale) {
        if (locale == null) return;
        setState(() => _dropdownValue = locale);
      },
      items: Language.values.map<DropdownMenuItem<Language>>((Language language) {
        return DropdownMenuItem<Language>(
          value: language,
          child: Text(language.name),
          onTap: () => Provider.of<LocaleProvider>(context, listen: false).setLocale(language),
        );
      }).toList(),
    );
  }
}
