import 'package:flutter/material.dart';
import 'package:mahalaxmi_developers/screen/splash%20screen/splash_screen_desktop.dart';
import 'package:mahalaxmi_developers/screen/splash%20screen/splash_screen_mobile.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context) => const SplashScreenMobile(),
      desktop: (context) => const SplashScreenDesktop(),
    );
  }
}
