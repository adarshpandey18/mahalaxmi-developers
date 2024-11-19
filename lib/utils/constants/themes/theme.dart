import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahalaxmi_developers/utils/constants/colors/app_colors.dart';
import 'package:mahalaxmi_developers/utils/constants/themes/app_bar_theme.dart';
import 'package:mahalaxmi_developers/utils/constants/themes/app_elevated_button_theme.dart';
import 'package:mahalaxmi_developers/utils/constants/themes/app_snackbar_theme.dart';
import 'package:mahalaxmi_developers/utils/constants/themes/app_text_theme_field.dart';
import 'package:mahalaxmi_developers/utils/constants/themes/text_theme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    textTheme: AppTextTheme.lightTextTheme,
    appBarTheme: CustomAppBarTheme.lightAppBarTheme,
    elevatedButtonTheme: AppElevatedButtonTheme.lightAppElevatedButtonTheme,
    inputDecorationTheme: AppTextFieldTheme.lightInputDecorationTheme,
    snackBarTheme: AppSnackbarTheme.lightSnackbarTheme,
    brightness: Brightness.light,
    useMaterial3: true,
    primaryColor: AppColors.royalBlue,
    scaffoldBackgroundColor: Colors.white,
    fontFamily: GoogleFonts.lato.toString(),
  );
  static ThemeData darkTheme = ThemeData(
    textTheme: AppTextTheme.darkTextTheme,
    appBarTheme: CustomAppBarTheme.darkAppBarTheme,
    elevatedButtonTheme: AppElevatedButtonTheme.darkAppElevatedButtonTheme,
    inputDecorationTheme: AppTextFieldTheme.darkInputDecorationTheme,
    snackBarTheme: AppSnackbarTheme.darkSnackbarTheme,
    brightness: Brightness.dark,
    useMaterial3: true,
    primaryColor: AppColors.midnightBlue,
    scaffoldBackgroundColor: AppColors.navyBlue,
    fontFamily: GoogleFonts.lato.toString(),
  );
}
