import 'package:flutter/material.dart';

class ThemeContext extends ChangeNotifier {
  bool isDark = false;

  ThemeMode get theme => isDark ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    isDark = !isDark;
    notifyListeners();
  }
}
