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
    primaryTextTheme: _lightThemeText,
    colorScheme: ColorScheme.light(
      primary: Colors.blue.shade900,
      secondary: Colors.blue.shade900.withOpacity(0.5)
    )
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: _primaryColorDarkTheme,
    primaryTextTheme: _darkThemeText,
    colorScheme: ColorScheme.dark(
      primary: Colors.blue.shade900,
      secondary: Colors.blue.shade900.withOpacity(0.5)
    )
  );

  // ************************ TEXT THEME ***************************

  // Create default text style, which allow us to create custom
  static final TextStyle defaultTextStyle = TextStyle(
    fontWeight: FontWeight.normal,
    color: Colors.grey.shade600,
    fontFamily: "Nunito"
  );

  static final TextTheme _lightThemeText = TextTheme(
    headline1: defaultTextStyle.copyWith(
      fontSize: 35,
      fontWeight: FontWeight.bold
    ),
    headline2: defaultTextStyle.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.bold
    ),
    bodyText1: defaultTextStyle.copyWith(
      fontSize: 16,
    )
  );

  static final TextTheme _darkThemeText = TextTheme(
    headline1: defaultTextStyle.copyWith(
      fontSize: 35,
      fontWeight: FontWeight.bold,
    ),
    headline2: defaultTextStyle.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
    bodyText1: defaultTextStyle.copyWith(
      fontSize: 16,
    )
  );
}