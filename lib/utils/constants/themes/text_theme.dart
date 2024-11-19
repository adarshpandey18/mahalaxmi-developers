import 'package:flutter/material.dart';
import 'package:mahalaxmi_developers/utils/constants/colors/app_colors.dart';
import 'package:mahalaxmi_developers/utils/constants/size/app_size.dart';

class AppTextTheme {
  AppTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    displayLarge: TextStyle(
      fontSize: AppSize.largeText,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    displayMedium: TextStyle(
      fontSize: AppSize.mediumText,
      fontWeight: FontWeight.bold,
      color: AppColors.navyBlue,
    ),
    bodyLarge: TextStyle(
      fontSize: AppSize.bodyLargeText,
      fontWeight: FontWeight.normal,
      color: AppColors.navyBlue,
    ),
    bodyMedium: TextStyle(
      fontSize: AppSize.bodyMediumText,
      fontWeight: FontWeight.normal,
      color: Colors.black54,
    ),
    bodySmall: TextStyle(
      fontSize: AppSize.bodySmallText,
      fontWeight: FontWeight.normal,
      color: Colors.black45,
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    displayLarge: TextStyle(
      fontSize: AppSize.largeText,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    displayMedium: TextStyle(
      fontSize: AppSize.mediumText,
      fontWeight: FontWeight.bold,
      color: AppColors.blueGray,
    ),
    bodyLarge: TextStyle(
      fontSize: AppSize.bodyLargeText,
      fontWeight: FontWeight.normal,
      color: AppColors.blueGray,
    ),
    bodyMedium: TextStyle(
      fontSize: AppSize.bodyMediumText,
      fontWeight: FontWeight.normal,
      color: Colors.white60,
    ),
    bodySmall: TextStyle(
      fontSize: AppSize.bodySmallText,
      fontWeight: FontWeight.normal,
      color: Colors.white54,
    ),
  );
}
