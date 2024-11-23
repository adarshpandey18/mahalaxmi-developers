import 'package:flutter/material.dart';
import 'package:mahalaxmi_developers/screen/about/about_desktop.dart';
import 'package:mahalaxmi_developers/screen/about/about_mobile.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context) => const AboutMobileScreen(),
      desktop: (context) => const AboutDesktopScreen(),
    );
  }
}
