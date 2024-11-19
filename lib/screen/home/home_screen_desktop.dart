import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahalaxmi_developers/screen/authentication/auth%20landing/auth_landing.dart';
import 'package:mahalaxmi_developers/widgets/auth_landing_button.dart';
import 'package:mahalaxmi_developers/widgets/drawer_list_tile.dart';
import 'package:mahalaxmi_developers/widgets/icon_card.dart';
import 'package:mahalaxmi_developers/widgets/logo_widget.dart';
import 'package:mahalaxmi_developers/widgets/navbar_items.dart';

class HomeScreenDesktop extends StatelessWidget {
  const HomeScreenDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(flex: 2, child: LogoWidget()),
                Expanded(
                  flex: 8,
                  child: Row(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const NavbarItems(text: 'Home', route: 'home'),
                          const NavbarItems(
                              text: 'Categories', route: 'categories'),
                          const NavbarItems(text: 'Agent', route: 'agent'),
                          const NavbarItems(text: 'Info', route: 'info'),
                        ],
                      ),
                      const Spacer(),
                      ElevatedButton.icon(
                        onPressed: () {},
                        label: Text('Sign Out'),
                        icon: Icon(
                          Icons.logout,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
