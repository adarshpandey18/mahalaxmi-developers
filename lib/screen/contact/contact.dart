import 'package:flutter/material.dart';
import 'package:mahalaxmi_developers/screen/contact/contact_desktop.dart';
import 'package:mahalaxmi_developers/screen/contact/contact_mobile.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      desktop: (context) => ContactDesktopScreen(),
      mobile: (context) => ContactMobileScreen(),
    );
  }
}
