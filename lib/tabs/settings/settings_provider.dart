import 'package:flutter/material.dart';

class SettingsProvider with ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  String LanguageCode = 'en';

  bool get isDark => themeMode == ThemeMode.dark;

  String get backGroundName => isDark ? 'dark_bg' : 'default_bg';

  void changeTheme(ThemeMode selectedTheme) {
    themeMode = selectedTheme;
    notifyListeners();
  }

  void changeLanguage(String selectedLanguage) {
    LanguageCode = selectedLanguage;
    notifyListeners();
  }
}
