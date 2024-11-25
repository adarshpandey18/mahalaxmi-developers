import 'package:flutter/material.dart';
import 'package:mahalaxmi_developers/utils/cateogory/admin_features.dart';
import 'package:mahalaxmi_developers/widgets/feature_container.dart';
import 'package:mahalaxmi_developers/widgets/logo_widget.dart';

class AdminMobileScreen extends StatelessWidget {
  const AdminMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const LogoWidget(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 400,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: 1,
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
          ),
        ),
      ),
    );
  }
}
