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

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.settings),
        ),
        body: Center(
          child: Column(
            children: [
              Expanded(
                child: SizedBox(
                  height: 50,
                  child: DecoratedBox(
                    decoration: const BoxDecoration(color: Colors.blueGrey),
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
              ),
            ],
          ),
        ),
      );
}

class DropDownMenu extends StatefulWidget {
  const DropDownMenu({Key? key}) : super(key: key);

  @override
  State<DropDownMenu> createState() => _DropDownMenuState();
}

class _DropDownMenuState extends State<DropDownMenu> {
  @override
  Widget build(BuildContext context) {
    String dropdownValue = 'English';
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
