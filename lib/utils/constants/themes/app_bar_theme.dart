import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahalaxmi_developers/utils/constants/colors/app_colors.dart';
import 'package:mahalaxmi_developers/utils/constants/size/app_size.dart';

class CustomAppBarTheme {
  CustomAppBarTheme._();
  static AppBarTheme lightAppBarTheme = AppBarTheme(
    backgroundColor: Colors.white,
    centerTitle: true,
    elevation: 0.0,
    foregroundColor: AppColors.royalBlue,
    toolbarHeight: 56.0,
    shadowColor: null,
    titleTextStyle: TextStyle(
      fontFamily: GoogleFonts.cinzel().fontFamily,
      fontSize: 22,
    ),
    iconTheme: IconThemeData(
      color: AppColors.royalBlue,
      size: AppSize.iconSize,
    ),
    scrolledUnderElevation: 0,
  );
  static AppBarTheme darkAppBarTheme = AppBarTheme(
    backgroundColor: AppColors.navyBlue,
    centerTitle: true,
    elevation: 0.0,
    foregroundColor: Colors.white,
    toolbarHeight: 56.0,
    shadowColor: null,
    titleTextStyle: TextStyle(
      fontFamily: GoogleFonts.cinzel().fontFamily,
      fontSize: 22,
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
      size: AppSize.iconSize,
    ),
    scrolledUnderElevation: 0,
  );
}
