import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mahalaxmi_developers/provider/auth_provider.dart';
import 'package:mahalaxmi_developers/utils/constants/strings/image_strings.dart';
import 'package:mahalaxmi_developers/widgets/desktop_navbar.dart';
import 'package:mahalaxmi_developers/widgets/logo_widget.dart';
import 'package:mahalaxmi_developers/widgets/navbar_items.dart';
import 'package:provider/provider.dart';

class HomeScreenDesktop extends StatelessWidget {
  const HomeScreenDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DesktopNavbar(
              authProvider: authProvider,
              currentPage: 'Home',
            ),
            const SizedBox(
              width: 15,
            ),
            Column(
              children: [
                Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            ImageStrings.splashScreenImageDesktop,
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
