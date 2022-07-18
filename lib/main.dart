import 'dart:async';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:park_app/src/common/localization/language.dart';
import 'package:park_app/src/common/widget/locale_provider.dart';
import 'package:park_app/src/common/widget/theme_provider.dart';
import 'package:park_app/src/feature/plants/widget/plants_screen.dart';
import 'package:park_app/src/feature/settings/widget/drop_down_menu.dart';
import 'package:park_app/src/feature/settings/widget/toggle_switch.dart';
import 'package:provider/provider.dart';
import 'src/common/localization/l10n.dart';
import 'src/feature/home/widget/home_screen.dart';
import 'src/feature/map/wdiget/map_screen.dart';
import 'src/feature/product/widget/product_screen.dart';

enum Menu { lenguage, theme }

void main() => runZonedGuarded<void>(
      () {
        WidgetsFlutterBinding.ensureInitialized();
        runApp(const ParkApp());
      },
      (error, stackTrace) => ('TOP LEVEL ERROR: $error\n$stackTrace'),
    );

class ParkApp extends StatelessWidget {
  const ParkApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LocaleProvider>(create: (_) => LocaleProvider()),
        ChangeNotifierProvider<ThemeProvider>(
          create: (_) => ThemeProvider()..initializeTheme(),
        )
      ],
      builder: (context, child) {
        final provider = Provider.of<LocaleProvider>(context);
        final themeProvider = Provider.of<ThemeProvider>(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            Localized.delegate,
          ],
          locale: provider.locale,
          supportedLocales: Language.values.map<Locale>((e) => e.locale).toList(growable: false),
          theme: themeProvider.theme,
          home: const SplashScreen(),
        );
      },
    );
  }
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
    const ProductScreen(),
    const MapScreen(),
    const PlantsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: screens[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: '',
            backgroundColor: Theme.of(context).primaryColor,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.shopping_bag_outlined),
            label: '',
            backgroundColor: Theme.of(context).primaryColor,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.map_rounded),
            label: '',
            backgroundColor: Theme.of(context).primaryColor,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.search),
            label: '',
            backgroundColor: Theme.of(context).primaryColor,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings),
            label: '',
            backgroundColor: Theme.of(context).primaryColor,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).secondaryHeaderColor,
        onTap: (int index) async {
          if (index == 4) {
            await showMenu<String>(
              context: context,
              position: const RelativeRect.fromLTRB(1000.0, 666.0, 0.0, 0.0),
              items: const <PopupMenuItem<String>>[
                PopupMenuItem<String>(value: 'lenguage', child: DropDownMenu()),
                PopupMenuItem<String>(value: 'theme', child: SwitchWidget()),
              ],
              color: Theme.of(context).primaryColor,
              elevation: 8.0,
            );
          } else {
            _onItemTapped(index);
          }
        },
      ),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: SizedBox(
        width: 250.0,
        child: DefaultTextStyle(
          style: const TextStyle(
            fontSize: 70.0,
            fontFamily: 'MavenPro',
            color: Colors.black,
          ),
          child: AnimatedTextKit(
            animatedTexts: [
              ScaleAnimatedText('Explore'),
              ScaleAnimatedText('Nature'),
              ScaleAnimatedText('of Azores'),
            ],
          ),
        ),
      ),
      nextScreen: const MainScreen(),
    );
  }
}
