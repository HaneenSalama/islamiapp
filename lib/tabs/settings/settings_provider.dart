import 'package:flutter/material.dart';

class SettingsProvider with ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  String LanguageCode = 'ar';

  bool get isDark => themeMode == ThemeMode.dark;

  String get backGroundName => isDark ? 'dark_bg' : 'default_bg';
  String get sebhaBody => isDark ? 'body_sebha_dark' : 'body_sebha_logo';
  String get sebhaHead => isDark ? 'head_sebha_dark' : 'head_sebha_logo';

  void changeTheme(ThemeMode selectedTheme) {
    themeMode = selectedTheme;
    notifyListeners();
  }

  void changeLanguage(String selectedLanguage) {
    if (selectedLanguage == LanguageCode) return;
    //print('inside fun');
    LanguageCode = selectedLanguage;
    notifyListeners();
  }
}
