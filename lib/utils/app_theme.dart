import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_colors.dart';

class appTheme {
  static ThemeData Darktheme = ThemeData(
    scaffoldBackgroundColor: appColors.transparent,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.black,
      backgroundColor: appColors.PrimaryColor,
      type: BottomNavigationBarType.fixed,
    ),
    iconTheme: IconThemeData(color: appColors.PrimaryColor),
  );
}
