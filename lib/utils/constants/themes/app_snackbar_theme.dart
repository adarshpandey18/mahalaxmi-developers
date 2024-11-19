import 'package:flutter/material.dart';
import 'package:mahalaxmi_developers/utils/constants/colors/app_colors.dart';

class AppSnackbarTheme {
  AppSnackbarTheme._();

  static SnackBarThemeData lightSnackbarTheme = const SnackBarThemeData(
    backgroundColor: AppColors.royalBlue,
    contentTextStyle: TextStyle(color: Colors.white),
  );

  static SnackBarThemeData darkSnackbarTheme = const SnackBarThemeData(
    backgroundColor: AppColors.navyBlue,
    contentTextStyle: TextStyle(color: Colors.white),
  );
}
