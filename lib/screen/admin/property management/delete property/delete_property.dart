import 'package:flutter/material.dart';
import 'package:mahalaxmi_developers/screen/admin/property%20management/delete%20property/delete_property_desktop.dart';
import 'package:mahalaxmi_developers/screen/admin/property%20management/delete%20property/delete_property_mobile.dart';
import 'package:responsive_builder/responsive_builder.dart';

class DeleteProperty extends StatelessWidget {
  const DeleteProperty({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context) => DeletePropertyMobile(),
      desktop: (context) => DeletePropertyDesktop(),
    );
  }
}
