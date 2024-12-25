import 'package:flutter/material.dart';
import 'package:mahalaxmi_developers/screen/categories/categories_screen_desktop.dart';
import 'package:mahalaxmi_developers/screen/categories/categories_screen_mobile.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (p0) => CategoriesScreenMobile(),
      desktop: (p0) => CategoriesScreenDesktop(),
    );
  }
}