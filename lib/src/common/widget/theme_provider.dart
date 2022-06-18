import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _theme = ThemeData.dark();

  ThemeData get theme => _theme;

  void setTheme(ThemeData theme) {
    _theme = theme;
    notifyListeners();
  }
}
