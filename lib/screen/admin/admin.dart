import 'package:flutter/material.dart';
import 'package:mahalaxmi_developers/screen/admin/admin_desktop.dart';
import 'package:mahalaxmi_developers/screen/admin/admin_mobile.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context) => const AdminMobileScreen(),
      desktop: (context) => const AdminDesktopScreen(),
    );
  }
}
