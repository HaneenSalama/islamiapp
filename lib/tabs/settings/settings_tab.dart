import 'package:flutter/material.dart';
import 'package:islamiapp/app_theme.dart';
import 'package:islamiapp/tabs/settings/language.dart';
import 'package:islamiapp/tabs/settings/language.dart';
import 'package:islamiapp/tabs/settings/language.dart';
import 'package:islamiapp/tabs/settings/settings_provider.dart';
import 'package:provider/provider.dart';
import 'language.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  List<Language> languages = [
    Language(name: 'English', code: 'en'),
    Language(name: 'العربية', code: 'ar'),
    //Language(name: 'Espanish', code: 'es'),
  ];
  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Dark theme',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
              ),
              Switch(
                value: settingsProvider.isDark,
                onChanged: (isDark) => settingsProvider
                    .changeTheme(isDark ? ThemeMode.dark : ThemeMode.light),
                activeTrackColor: AppTheme.gold,
                //isDark ? ThemeMode.dark : ThemeData.light
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Language',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
              ),
              DropdownButtonHideUnderline(
                child: DropdownButton<Language>(
                  value: languages.firstWhere((Language) =>
                      Language.code == settingsProvider.LanguageCode),
                  items: languages
                      .map(
                        (language) => DropdownMenuItem<Language>(
                          value: language,
                          child: Text(
                            language.name,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                      )
                      .toList(),
                  //  [
                  //   DropdownMenuItem(
                  //     child: Text('English'),
                  //     value: 'en',
                  //   ),
                  //   DropdownMenuItem(
                  //     child: Text('العربية'),
                  //     value: 'ar',
                  //   ),
                  // ],
                  onChanged: (selecedLanguage) {
                    if (selecedLanguage != null) {
                      print(selecedLanguage.code);
                    }
                  },
                  borderRadius: BorderRadius.circular(20),
                  dropdownColor: settingsProvider.isDark
                      ? AppTheme.darkPrimary
                      : AppTheme.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
