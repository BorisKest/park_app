import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:park_app/src/common/localization/language.dart';
import 'package:park_app/src/common/widget/locale_provider.dart';
import 'package:park_app/src/common/widget/theme_provider.dart';
import 'package:park_app/src/feature/main_screen/main_screen.dart';
import 'package:provider/provider.dart';
import 'src/common/localization/l10n.dart';

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
