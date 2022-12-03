import 'package:flutter/material.dart';
import 'package:park_app/src/common/localization/language.dart';
import 'package:park_app/src/common/widget/locale_provider.dart';
import 'package:park_app/src/feature/plants/models.dart';
import 'package:park_app/src/feature/plants/services/sql_helper.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DropDownMenu extends StatefulWidget {
  const DropDownMenu({
    Key? key,
  }) : super(key: key);
  @override
  State<DropDownMenu> createState() => _DropDownMenuState();
}

class _DropDownMenuState extends State<DropDownMenu> {
  @override
  void initState() {
    super.initState();
    _getLanguage();
  }

  Future<Language> _getLanguage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return Language.values[prefs.getInt('lenguage') ?? 0];
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Language>(
      future: _getLanguage(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return DropdownButton<Language>(
            value: snapshot.data,
            icon: const Icon(Icons.arrow_downward),
            elevation: 10,
            style: const TextStyle(
              color: Colors.black,
            ),
            onChanged: (Language? locale) {
              if (locale == null) return;
              setState(() {
                _getLanguage();
              });
            },
            items: Language.values.map<DropdownMenuItem<Language>>(
              (Language language) {
                return DropdownMenuItem<Language>(
                    value: language,
                    child: Text(language.name),
                    onTap: () async {
                      Provider.of<LocaleProvider>(context, listen: false).setLocale(language);
                      final data = await DBHelper.getItems();
                      setState(() {
                        _getLanguage();
                        plants = data; //wtf
                      });
                    });
              },
            ).toList(),
          );
        }
        return const Text('Error: 210');
      },
    );
  }
}
