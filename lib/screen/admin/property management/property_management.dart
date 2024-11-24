import 'package:flutter/material.dart';
import 'package:mahalaxmi_developers/screen/admin/property%20management/property_management_desktop.dart';
import 'package:mahalaxmi_developers/screen/admin/property%20management/property_management_mobile.dart';
import 'package:responsive_builder/responsive_builder.dart';

class PropertyManagementScreen extends StatelessWidget {
  const PropertyManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context) => const PropertyManagementMobile(),
      desktop: (context) => const PropertyManagementDesktop(),
    );
  }
}
