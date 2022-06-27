import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/localization/language.dart';
import '../../../common/widget/locale_provider.dart';
import '../../../common/widget/shered_preferences.dart';

class DropDownMenu extends StatefulWidget {
  DropDownMenu({
    Key? key,
  }) : super(key: key);
  @override
  State<DropDownMenu> createState() => _DropDownMenuState();
}

class _DropDownMenuState extends State<DropDownMenu> {
  final _preferencesService = PreferencesServis();
  Language language = Language.english;

  @override
  void initState() {
    super.initState();
    language = Provider.of<LocaleProvider>(context, listen: false).language;
    _popFilds();
    //dropdownValue
  }

  void _popFilds() async {
    final settings = await _preferencesService.getSettings();
    setState(() {
      language = settings.lenguage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<Language>(
      value: language,
      icon: const Icon(Icons.arrow_downward),
      elevation: 10,
      style: const TextStyle(
        color: Colors.blue,
      ),
      onChanged: (Language? locale) {
        if (locale == null) return;
        setState(() => language = locale);
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
