import 'package:flutter/material.dart';
import 'package:mahalaxmi_developers/widgets/logo_widget.dart';

class AboutMobileScreen extends StatelessWidget {
  const AboutMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          LogoWidget(),
        ],
      ),
    );
  }
}
