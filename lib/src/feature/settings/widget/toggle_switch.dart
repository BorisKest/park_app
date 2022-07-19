import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../common/widget/theme_provider.dart';

class SwitchWidget extends StatefulWidget {
  const SwitchWidget({Key? key}) : super(key: key);

  @override
  State<SwitchWidget> createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
  IconData icon = Icons.dark_mode;

  Future<bool> _setBool() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String theme = prefs.getString('theme') ?? 'lightTheme';
    if (theme == 'darkTheme') {
      icon = Icons.dark_mode;
      return true;
    } else {
      icon = Icons.light_mode;
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _setBool(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Row(
            children: [
              Icon(icon),
              Switch(
                value: snapshot.data ?? false,
                onChanged: (bool newValue) {
                  setState(
                    () {
                      _setTheme(newValue);
                    },
                  );
                },
              ),
            ],
          );
        }
        return const Text('Error: 210');
      },
    );
  }

  void _setTheme(newValue) async {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (newValue == false) {
      await prefs.setString('theme', 'lightTheme');
      themeProvider.setTheme(ThemeProvider.lightTheme);
    } else {
      await prefs.setString('theme', 'darkTheme');
      themeProvider.setTheme(ThemeProvider.darkTheme);
    }
  }
}
