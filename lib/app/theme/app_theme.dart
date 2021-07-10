import 'package:flutter/material.dart';
import 'theme_lib.dart';

class AppTheme {

  static final ThemeData primaryTheme = new ThemeData(

    primarySwatch: AppColors.getMaterialColor(AppColors.toolbarColor.value),
    primaryColor: AppColors.getMaterialColor(AppColors.primaryColor.value),
    textTheme: TextTheme(

      headline1: TextStyle(
          fontSize: 48,
          color: AppColors.lightColor,
          fontWeight: FontWeight.bold,
          height: 1),
      // 28 primary bold
      headline2: TextStyle(
          fontSize: 28,
          color: AppColors.primaryColor,
          fontWeight: FontWeight.bold,
          height: 1),
      headline4: TextStyle(
          fontSize: 24,
          color: AppColors.primaryColor,
          fontWeight: FontWeight.bold,
          height: 1),
      headline5:
          TextStyle(fontSize: 21, color: AppColors.primaryColor, height: 1),
      // 21 primary normal
      headline6: TextStyle(
          fontSize: 18, // 18 primary normal
          color: AppColors.primaryColor,
          height: 1),

      button: TextStyle(fontSize: 22, color: Colors.white, height: 1),
      // button text style 22
      bodyText1: TextStyle(
          // body text 18
          fontSize: 18,
          color: AppColors.fontTextGrey,
          fontWeight: FontWeight.normal,
          height: 1),
      bodyText2: TextStyle(
          fontSize: 21, // body text 21
          color: AppColors.fontTextGrey,
          fontWeight: FontWeight.normal,
          height: 1),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
