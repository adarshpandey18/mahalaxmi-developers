import 'package:flutter/material.dart';
import 'package:mahalaxmi_developers/screen/authentication/sign%20up/sign_up_desktop.dart';
import 'package:mahalaxmi_developers/screen/authentication/sign%20up/sign_up_mobile.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context) => const SignUpMobile(),
      desktop: (context) => const SignUpDesktop(),
    );
  }
}
