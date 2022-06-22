import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:park_app/src/common/widget/locale_provider.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:park_app/src/common/widget/locale_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:park_app/l10n/l10n.dart';
import 'package:provider/provider.dart';
import 'package:park_app/src/common/widget/theme_provider.dart';

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
                      AppLocalizations.of(context)!.leng,
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
                child: Row(
                  children: [
                    const Icon(Icons.language),
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
                              print(s);
                              themeProvider.setTheme(ThemeProvider.lightTheme);
                            } else {
                              print(s);
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
  String dropdownValue = 'English';
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LocaleProvider>(context);
    final locale = provider.locale;

    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 10,
      style: const TextStyle(
        color: Colors.blue,
      ),
      onChanged: (String? locale) {
        setState(() {
          dropdownValue = locale!;
        });
      },
      items: <String>[
        'English',
        'Português',
        'Deutsch',
        'Magyar',
        'Español',
        'Русский'
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
          onTap: () {
            provider.setLocale(L10n.getLenguageCode(value));
          },
        );
      }).toList(),
    );
  }
}
