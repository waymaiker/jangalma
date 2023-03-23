import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jangalma/helpers/constants.dart';

final themeProvider = ChangeNotifierProvider(
  (ref) => ThemeController()
);

class ThemeController extends ChangeNotifier {
  ThemeMode currentTheme = ThemeMode.light;

  ThemeController();

  ThemeMode getCurrentTheme() => currentTheme;

  void switchTheme(ThemeModeCustom value){
    switch (value) {
      case ThemeModeCustom.system:
        currentTheme = ThemeMode.system;
        break;
      case ThemeModeCustom.on:
        currentTheme = ThemeMode.dark;
        break;
      case ThemeModeCustom.off:
        currentTheme = ThemeMode.light;
        break;
      default:
    }

    notifyListeners();
  }

  ThemeData get getLightTheme => lightTheme;
  ThemeData get getDarkTheme => darkTheme;

  // *********************** GLOBAL THEME **************************

  static final Color _primaryColorLightTheme = Colors.grey.shade400;
  static final Color _primaryColorDarkTheme = Colors.blueGrey.shade800;

  static final ThemeData lightTheme = ThemeData(
    primaryColor: _primaryColorLightTheme,
    textTheme: _lightThemeText,
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: _primaryColorDarkTheme,
    textTheme: _darkThemeText,
  );

  // ************************ TEXT THEME ***************************
  
  // Create default text style, which allow us to create custom
  static final TextStyle defaultTextStyle = 
    TextStyle(
      fontWeight: FontWeight.normal,
      color: _primaryColorLightTheme,
      fontFamily: "Nunito"
    );

  static final TextTheme _lightThemeText = TextTheme(
    headline1: defaultTextStyle.copyWith(
      fontSize: 30,
      fontWeight: FontWeight.bold
    ),
    headline2: defaultTextStyle.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.bold
    ),     
  );

  static final TextTheme _darkThemeText = TextTheme(
    headline1: defaultTextStyle.copyWith(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: _primaryColorDarkTheme,
    ),
    headline2: defaultTextStyle.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: _primaryColorDarkTheme,
    ),    
  );
}