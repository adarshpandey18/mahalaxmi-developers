import 'package:flutter/material.dart';
import 'package:mahalaxmi_developers/screen/admin/property%20management/add%20property/add_property_desktop.dart';
import 'package:mahalaxmi_developers/screen/admin/property%20management/add%20property/add_property_mobile.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AddPropertyScreen extends StatelessWidget {
  const AddPropertyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context) => const AddPropertyMobile(),
      desktop: (context) => const AddPropertyDesktop(),
    );
  }
}
