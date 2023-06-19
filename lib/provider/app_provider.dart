import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;

  void changeTheme(ThemeMode mode) async {
    if (mode == themeMode) return;
    themeMode = mode;
    notifyListeners();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('theme', themeMode == ThemeMode.light ? 'light' : 'dark');
  }

  String language = 'en';

  void changeLanguage(String lang) async {
    if (lang == language) return;
    language = lang;
    notifyListeners();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('lang', language);
  }

  void getSharedPreferences() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String language = prefs.getString('lang') ?? 'en';
    String theme = prefs.getString('theme') ?? 'light';
    changeLanguage(language);
    changeTheme(theme == 'light' ? ThemeMode.light : ThemeMode.dark);
  }



}
