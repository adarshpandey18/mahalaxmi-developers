import 'package:flutter/material.dart';
import 'package:mahalaxmi_developers/screen/categories/property%20details/property_details_desktop.dart';
import 'package:mahalaxmi_developers/screen/categories/property%20details/property_details_mobile.dart';
import 'package:responsive_builder/responsive_builder.dart';

class PropertyDetails extends StatelessWidget {
  const PropertyDetails({super.key, required this.property});
  final Map<String, dynamic> property;

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (p0) => PropertyDetailsMobile(property: property,),
      desktop: (p0) => PropertyDetailsDesktop(
        property: property,
      ),
    );
  }
}
