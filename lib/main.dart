import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:park_app/src/common/widget/locale_provider.dart';
import 'src/feature/home/widget/home_screen.dart';
import 'src/feature/product/widget/product_screen.dart';
import 'src/feature/map/wdiget/map_screen.dart';
import 'src/feature/contacts/widget/contact_screen.dart';
import 'src/feature/settings/widget/settings_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'src/common/const/colors.dart';
import 'l10n/l10n.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const ParkApp());
}

class ParkApp extends StatelessWidget {
  const ParkApp({super.key});

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => LocaleProvider(),
        builder: (context, child) {
          final provider = Provider.of<LocaleProvider>(context);

          return MaterialApp(
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            locale: provider.locale,
            supportedLocales: L10n.all,
            theme: ThemeData(
              brightness: Brightness.dark,
            ),
            home: const MainScreen(),
          );
        },
      );
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final screens = [
    HomeScreen(),
    ProductScreen(),
    const MapScreen(),
    const ContactScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
            backgroundColor: Color.fromARGB(255, 95, 95, 95),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: '',
            backgroundColor: Color.fromARGB(255, 138, 138, 137),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map_rounded),
            label: '',
            backgroundColor: Color.fromARGB(255, 174, 175, 174),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            label: '',
            backgroundColor: Color.fromARGB(255, 174, 179, 184),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '',
            backgroundColor: Color.fromARGB(255, 199, 196, 196),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 253, 253, 253),
        onTap: _onItemTapped,
      ),
    );
  }
}
