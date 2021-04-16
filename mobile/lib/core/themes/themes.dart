import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:location_tracker/core/themes/colors.dart';

class Themes {
  static final defaultTheme = ThemeData(
    primarySwatch: Colors.blue,
    primaryColor: AppColors.primaryOrange,
    accentColor: AppColors.primaryBlue,
    primaryColorDark: AppColors.pureBlack,
    backgroundColor: AppColors.pureWhite,
    scaffoldBackgroundColor: AppColors.lightBlueGrey,
    errorColor: AppColors.mediumRed,
    buttonTheme: ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
      buttonColor: AppColors.lightBlue,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
    ),
    textTheme: GoogleFonts.openSansTextTheme(),
  );
}
