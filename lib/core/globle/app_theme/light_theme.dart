import 'package:flutter/material.dart';

import '../app_color/app_color_light.dart';

ThemeData lightTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
  scaffoldBackgroundColor: AppColorLight.homeBackGroundColor,
  appBarTheme: AppBarTheme(
    elevation: 0.0,
    color: AppColorLight.appBarColor,
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedIconTheme: IconThemeData(
      color: Colors.black,
      applyTextScaling: false
    ),
    selectedItemColor: Colors.black,
    showSelectedLabels: true,
    unselectedItemColor: Colors.grey,
    showUnselectedLabels: false,
    unselectedIconTheme: IconThemeData(
      color: Colors.grey,
    ),

  )
);
