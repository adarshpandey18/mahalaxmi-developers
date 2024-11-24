import 'package:flutter/material.dart';
import 'package:mahalaxmi_developers/widgets/logo_widget.dart';

class ContactMobileScreen extends StatelessWidget {
  const ContactMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const LogoWidget(),
            const Divider(
              indent: 200,
              endIndent: 200,
              thickness: 2,
            )
          ],
        ),
      ),
    );
  }
}
