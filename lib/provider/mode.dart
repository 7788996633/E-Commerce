import 'package:flutter/material.dart';

enum ThemeModeType {
  light,
  dark,
}

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = ThemeData.light();

  ThemeModeType _themeMode = ThemeModeType.light;
  ThemeModeType get themeMode => _themeMode;

  ThemeData get themeData => _themeData;

  void toggleTheme() {
    _themeMode = _themeMode == ThemeModeType.light
        ? ThemeModeType.dark
        : ThemeModeType.light;
    _themeData = _themeMode == ThemeModeType.light
        ? ThemeData.light()
        : ThemeData.dark();
    notifyListeners();
  }
}
