import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahalaxmi_developers/utils/cateogory/admin_features.dart';
import 'package:mahalaxmi_developers/widgets/feature_container.dart';
import 'package:mahalaxmi_developers/widgets/logo_widget.dart';

class AdminDesktopScreen extends StatelessWidget {
  const AdminDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const LogoWidget(),
        leading: null,
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.5,
                  crossAxisSpacing: 40,
                  mainAxisSpacing: 40,
                  mainAxisExtent: 340,
                ),
                itemCount: AdminFeatures.features.length,
                itemBuilder: (context, index) {
                  Map<String, dynamic> map = AdminFeatures.features[index];
                  return FeatureContainer(
                    text: map['name'],
                    iconData: map['iconData'],
                    route: map['route'],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
