import 'package:flutter/material.dart';
import 'package:mahalaxmi_developers/screen/authentication/auth%20landing/auth_landing_desktop.dart';
import 'package:mahalaxmi_developers/screen/authentication/auth%20landing/auth_landing_mobile.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AuthLanding extends StatefulWidget {
  const AuthLanding({super.key});

  @override
  State<AuthLanding> createState() => _AuthLandingState();
}

class _AuthLandingState extends State<AuthLanding> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context) => const AuthLandingMobile(),
      desktop: (context) => const AuthLandingDesktop(),
    );
  }
}
