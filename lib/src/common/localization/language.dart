import 'package:flutter/widgets.dart' show Locale;

enum Language {
  english('en', 'English'),
  spanish('es', 'Spanish'),
  russian('ru', 'Russian'),
  portuges('pt', 'Portuges'),
  german('de', 'German'),
  magyar('hu', 'Magyar');

  const Language(this.code, this.name);

  final String code;
  final String name;
  Locale get locale => Locale(code);
}
