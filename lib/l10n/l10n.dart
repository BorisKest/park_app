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
        return const Locale('en');
      case 'Español':
        return const Locale('es');
      case 'Русский':
        return const Locale('ru');
      case 'Português':
        return const Locale('pt');
      case 'Deutsch':
        return const Locale('de');
      case 'Magyar':
        return const Locale('hu');
    }
  }
}
