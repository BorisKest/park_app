import 'package:flutter/cupertino.dart';

class L10n {
  static final all = [
    const Locale('en'), // English
    const Locale('es'), // Spanish
    const Locale('ru'), // Russian
    const Locale('pt'), // Portuges
    const Locale('de'), // German
    const Locale('hu'), // Magyar
  ];

  static getLenguageCode(String code) {
    switch (code) {
      case 'English':
        return Locale('en');
      case 'Español':
        return Locale('es');
      case 'Русский':
        return Locale('ru');
      case 'Português':
        return Locale('pt');
      case 'Deutsch':
        return Locale('de');
      case 'Magyar':
        return Locale('hu');
    }
  }
}
