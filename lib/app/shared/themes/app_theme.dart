import 'package:flutter/material.dart';

import 'text_theme.dart';

final ThemeData lightTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.deepPurple,
    // ···
    brightness: Brightness.light,
  ),
  textTheme: lightTextTheme,
);

final ThemeData darkTheme = ThemeData(
  // Define the default brightness and colors.
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.deepOrange,
    // ···
    brightness: Brightness.dark,
  ),
  textTheme: darkTextTheme,
);
