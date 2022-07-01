import 'package:flutter/material.dart';
import 'package:park_app/src/common/const/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _theme = darkTheme;

  ThemeData get theme => _theme;

  void setTheme(ThemeData theme) async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();

    await _prefs.setString('theme', _theme.toString());
    _theme = theme;
    notifyListeners();
  }

  initializeTheme() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();

    if (_prefs.getString('theme') == 'darkTheme') {
      _theme = darkTheme;
    } else {
      _theme = lightTheme;
    }
    notifyListeners();
  }

  static ThemeData get lightTheme {
    return ThemeData(
      highlightColor: kHighlitghtColorLite,
      primaryColor: kPrimaryColorLite,
      secondaryHeaderColor: kSecibdaryHederColorLite,
      backgroundColor: kBackgroundColorLite,
      scaffoldBackgroundColor: kBackgroundColorLite,
      textTheme: const TextTheme(
        headline1: TextStyle(color: Colors.black),
        headline2: TextStyle(color: Colors.black),
        headline3: TextStyle(color: Colors.black),
        bodyText1: TextStyle(color: Colors.black),
        bodyText2: TextStyle(color: Colors.black),
      ),
      iconTheme: const IconThemeData(color: Colors.black),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      highlightColor: kHighlitghtColorDark,
      primaryColor: kPrimaryColorDark,
      secondaryHeaderColor: kSecibdaryHederColorDark,
      backgroundColor: kBackgroundColorDark,
      scaffoldBackgroundColor: kBackgroundColorDark,
      textTheme: const TextTheme(
        headline1: TextStyle(color: Colors.white),
        headline2: TextStyle(color: Colors.white),
        headline3: TextStyle(color: Colors.white),
        headline4: TextStyle(color: Colors.white),
        headline5: TextStyle(color: Colors.white),
        headline6: TextStyle(color: Colors.white),
        bodyText1: TextStyle(color: Colors.white),
        bodyText2: TextStyle(color: Colors.white),
      ),
      iconTheme: const IconThemeData(color: Colors.white),
    );
  }
}
