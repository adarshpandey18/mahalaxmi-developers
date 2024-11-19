import 'package:flutter/material.dart';
import 'package:mahalaxmi_developers/screen/home/home_screen_desktop.dart';
import 'package:mahalaxmi_developers/screen/home/home_screen_mobile.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context) => const HomeScreenMobile(),
      desktop: (context) => const HomeScreenDesktop(),
    );
  }
}
