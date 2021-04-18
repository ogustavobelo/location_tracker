import 'package:flutter/material.dart';
import 'package:location_tracker/core/constants/fonts.dart';
import 'package:location_tracker/core/themes/colors.dart';

class Themes {
  static final defaultTheme = ThemeData(
    primarySwatch: Colors.blue,
    primaryColor: AppColors.primaryOrange,
    accentColor: AppColors.primaryBlue,
    primaryColorDark: AppColors.darkGrey,
    backgroundColor: AppColors.pureWhite,
    scaffoldBackgroundColor: AppColors.lightBlueGrey,
    errorColor: AppColors.mediumRed,
    hintColor: AppColors.mediumBlueGrey,
    fontFamily: Fonts.pressStart,
    appBarTheme: AppBarTheme(
        textTheme: TextTheme(
            headline6: TextStyle(
                fontFamily: Fonts.pressStart,
                fontSize: 18,
                color: AppColors.darkGrey))),
    buttonTheme: ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
      buttonColor: AppColors.lightBlue,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
    ),
  );
}
