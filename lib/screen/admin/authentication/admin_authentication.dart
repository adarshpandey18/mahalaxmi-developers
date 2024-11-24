import 'package:flutter/material.dart';
import 'package:mahalaxmi_developers/screen/admin/authentication/admin_authentication_desktop.dart';
import 'package:mahalaxmi_developers/screen/admin/authentication/admin_authentication_mobile.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AdminAuthentication extends StatelessWidget {
  const AdminAuthentication({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context) => const AdminAuthenticationMobileScreen(),
      desktop: (context) => const AdminAuthenticationDesktopScreen(),
    );
  }
}
