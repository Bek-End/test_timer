


import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Test timer';

  @override
  String get timersList => 'timers list';

  @override
  String get total => 'total';

  @override
  String get paused => 'paused';

  @override
  String get timer => 'Timer';

  @override
  String get newTimer => 'new timer';

  @override
  String get startRandomTimer => 'start random timer';
}
