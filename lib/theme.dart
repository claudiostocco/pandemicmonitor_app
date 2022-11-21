import 'package:flutter/material.dart';

enum kThemes { light, dark }

class CustomizedTheme {
  final kThemes currentTheme;

  CustomizedTheme(this.currentTheme);

  ThemeData getCustomizedTheme() {
    var initialTheme = currentTheme == kThemes.dark ? ThemeData.dark() : ThemeData.light();
    return initialTheme.copyWith(
        colorScheme: initialTheme.colorScheme.copyWith(
      primary: Colors.blue.shade900,
    ));
  }
}
