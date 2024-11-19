import 'package:flutter/material.dart';
import 'package:mahalaxmi_developers/screen/authentication/sign%20in/sign_in_desktop.dart';
import 'package:mahalaxmi_developers/screen/authentication/sign%20in/sign_in_mobile.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context) => const SignInMobile(),
      desktop: (context) => const SignInDesktop(),
    );
  }
}
