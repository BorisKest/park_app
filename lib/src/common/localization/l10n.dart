// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class Localized {
  Localized();

  static Localized? _current;

  static Localized get current {
    assert(_current != null,
        'No instance of Localized was loaded. Try to initialize the Localized delegate before accessing Localized.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<Localized> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = Localized();
      Localized._current = instance;

      return instance;
    });
  }

  static Localized of(BuildContext context) {
    final instance = Localized.maybeOf(context);
    assert(instance != null,
        'No instance of Localized present in the widget tree. Did you add Localized.delegate in localizationsDelegates?');
    return instance!;
  }

  static Localized? maybeOf(BuildContext context) {
    return Localizations.of<Localized>(context, Localized);
  }

  /// `en`
  String get language_code {
    return Intl.message(
      'en',
      name: 'language_code',
      desc: 'Код языка',
      args: [],
    );
  }

  /// `English`
  String get current_language {
    return Intl.message(
      'English',
      name: 'current_language',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get language {
    return Intl.message(
      'English',
      name: 'language',
      desc: 'The current Language',
      args: [],
    );
  }

  /// `Language`
  String get leng {
    return Intl.message(
      'Language',
      name: 'leng',
      desc: '',
      args: [],
    );
  }

  /// `About park`
  String get aboutPark {
    return Intl.message(
      'About park',
      name: 'aboutPark',
      desc: '',
      args: [],
    );
  }

  /// `One of the highest waterfalls on the island.One of the oldest parks on the island.  Grena is home to many animals, including the morcego, the only endemic mammal of the Azores. Several trails, ranging from 500m up to 5,4km.One of the largest Eucalyptus on the island.`
  String get descriptionText {
    return Intl.message(
      'One of the highest waterfalls on the island.One of the oldest parks on the island.  Grena is home to many animals, including the morcego, the only endemic mammal of the Azores. Several trails, ranging from 500m up to 5,4km.One of the largest Eucalyptus on the island.',
      name: 'descriptionText',
      desc: '',
      args: [],
    );
  }

  /// `Park History`
  String get parkHistory {
    return Intl.message(
      'Park History',
      name: 'parkHistory',
      desc: '',
      args: [],
    );
  }

  /// `In 1832 an English man acquires a beautiful land surrounding Furnas lake. In 1858, it's next owner - Vines, an English Consul in Ponta Delgada - builds a summer house at the property and calls it Grená in tribute to his wife's who spent her childhood summers in Ireland at a family house with that name. After his dead in 1874, the property goes to a London surgeon, name Hinton, who also passes away one year later. In 1875 James Brown explores the house has a hotel for a few years. After his dead, in 1882, D. Catarina sells the property to Jorge Hayes who rents it to the Portuguese José do Canto a few years later.`
  String get historyPart0 {
    return Intl.message(
      'In 1832 an English man acquires a beautiful land surrounding Furnas lake. In 1858, it\'s next owner - Vines, an English Consul in Ponta Delgada - builds a summer house at the property and calls it Grená in tribute to his wife\'s who spent her childhood summers in Ireland at a family house with that name. After his dead in 1874, the property goes to a London surgeon, name Hinton, who also passes away one year later. In 1875 James Brown explores the house has a hotel for a few years. After his dead, in 1882, D. Catarina sells the property to Jorge Hayes who rents it to the Portuguese José do Canto a few years later.',
      name: 'historyPart0',
      desc: '',
      args: [],
    );
  }

  /// `In June of 1987 the Portuguese Governors, President Mario Soares and Primer Minister Cavaco Silva, are advised to buy the property from the last heirs - family Mendonça Dias - to accommodate the Government members when visiting the Azores.`
  String get historyPart1 {
    return Intl.message(
      'In June of 1987 the Portuguese Governors, President Mario Soares and Primer Minister Cavaco Silva, are advised to buy the property from the last heirs - family Mendonça Dias - to accommodate the Government members when visiting the Azores.',
      name: 'historyPart1',
      desc: '',
      args: [],
    );
  }

  /// `Mota Amaral and Joaquim Ponte, representatives of the Azorean Region in the Portuguese Government, presented several claims to the abandon of Grená - a Portuguese patrimony - left to ruins by the Government over the last 22 years.`
  String get historyPart2 {
    return Intl.message(
      'Mota Amaral and Joaquim Ponte, representatives of the Azorean Region in the Portuguese Government, presented several claims to the abandon of Grená - a Portuguese patrimony - left to ruins by the Government over the last 22 years.',
      name: 'historyPart2',
      desc: '',
      args: [],
    );
  }

  /// `Several years after many internal bureaucracy, the Portuguese Government gives Grená's ownership to the Azorean Autonomous Region.`
  String get historyPart3 {
    return Intl.message(
      'Several years after many internal bureaucracy, the Portuguese Government gives Grená\'s ownership to the Azorean Autonomous Region.',
      name: 'historyPart3',
      desc: '',
      args: [],
    );
  }

  /// `The Azorean Government decides to sell Grená's property, which was left abandoned in a high state of degradation. Feliz Terra buys it and initiates their hard work to clean and dignify the property again as a nature gift.`
  String get historyPart4 {
    return Intl.message(
      'The Azorean Government decides to sell Grená\'s property, which was left abandoned in a high state of degradation. Feliz Terra buys it and initiates their hard work to clean and dignify the property again as a nature gift.',
      name: 'historyPart4',
      desc: '',
      args: [],
    );
  }

  /// `More than one year later with a tremendous effort from a dedicated team to recover Grená's beauty, the park open to the general public, giving back preserved nature to people.`
  String get historyPart5 {
    return Intl.message(
      'More than one year later with a tremendous effort from a dedicated team to recover Grená\'s beauty, the park open to the general public, giving back preserved nature to people.',
      name: 'historyPart5',
      desc: '',
      args: [],
    );
  }

  /// `Canoe`
  String get canoe {
    return Intl.message(
      'Canoe',
      name: 'canoe',
      desc: '',
      args: [],
    );
  }

  /// `You can go on a fantastic adventure on Lake Furnas in one of our canoes`
  String get canoeDescription {
    return Intl.message(
      'You can go on a fantastic adventure on Lake Furnas in one of our canoes',
      name: 'canoeDescription',
      desc: '',
      args: [],
    );
  }

  /// `Pedal Boat`
  String get pedalBoat {
    return Intl.message(
      'Pedal Boat',
      name: 'pedalBoat',
      desc: '',
      args: [],
    );
  }

  /// `On our pedal boat you can enjoy a relaxing ride with friends`
  String get pedalBoatDescription {
    return Intl.message(
      'On our pedal boat you can enjoy a relaxing ride with friends',
      name: 'pedalBoatDescription',
      desc: '',
      args: [],
    );
  }

  /// `Bike`
  String get bike {
    return Intl.message(
      'Bike',
      name: 'bike',
      desc: '',
      args: [],
    );
  }

  /// `E-bikes allow you to ride around the lake in just one hour, without losing any of your energy and allowing you to continue your tour of the azores!`
  String get bikeDescription {
    return Intl.message(
      'E-bikes allow you to ride around the lake in just one hour, without losing any of your energy and allowing you to continue your tour of the azores!',
      name: 'bikeDescription',
      desc: '',
      args: [],
    );
  }

  /// `Contacts`
  String get contacts {
    return Intl.message(
      'Contacts',
      name: 'contacts',
      desc: '',
      args: [],
    );
  }

  /// `Adres`
  String get adres {
    return Intl.message(
      'Adres',
      name: 'adres',
      desc: '',
      args: [],
    );
  }

  /// `Website`
  String get website {
    return Intl.message(
      'Website',
      name: 'website',
      desc: '',
      args: [],
    );
  }

  /// `Map`
  String get map {
    return Intl.message(
      'Map',
      name: 'map',
      desc: '',
      args: [],
    );
  }

  /// `Services`
  String get services {
    return Intl.message(
      'Services',
      name: 'services',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Theme`
  String get theme {
    return Intl.message(
      'Theme',
      name: 'theme',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<Localized> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'de'),
      Locale.fromSubtags(languageCode: 'es'),
      Locale.fromSubtags(languageCode: 'hu'),
      Locale.fromSubtags(languageCode: 'pt'),
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<Localized> load(Locale locale) => Localized.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
