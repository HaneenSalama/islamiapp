import 'package:flutter/material.dart';

class SettingsProvider with ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  String LanguageCode = 'ar';

  bool get isDark => themeMode == ThemeMode.dark;

  String get backGroundName => isDark ? 'dark_bg' : 'default_bg';

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
