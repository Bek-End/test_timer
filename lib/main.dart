import 'package:flutter/material.dart';
import 'package:test_timer/modules/core/presentation/l10n/app_localizations.dart';
import 'package:test_timer/modules/core/presentation/theme/themes.dart';
import 'package:test_timer/modules/timer/presentation/screens/all_timers_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test Timer',
      onGenerateTitle: (context) => AppLocalizations.of(context).appTitle,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      theme: Themes.lightTheme,
      home: const AllTimersScreen(),
    );
  }
}
