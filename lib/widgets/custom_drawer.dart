import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahalaxmi_developers/provider/auth_provider.dart';
import 'package:mahalaxmi_developers/widgets/drawer_list_tile.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Drawer(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        children: [
          DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'MAHALAXMI',
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        height: 1,
                        fontFamily: GoogleFonts.cinzel().fontFamily,
                      ),
                ),
                Text(
                  'DEVELOPERS',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        height: 0.6,
                      ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DrawerListTile(
                  text: 'Profile',
                  onTap: () {
                    Navigator.pushNamed(context, '/profile');
                  },
                  iconData: Icons.person,
                  changeColor: false,
                ),
                DrawerListTile(
                  text: 'Categories',
                  onTap: () {
                    Navigator.pushNamed(context, '/categories');
                  },
                  iconData: FontAwesomeIcons.building,
                  changeColor: false,
                ),
                DrawerListTile(
                  text: 'Agent',
                  onTap: () {
                    Navigator.pushNamed(context, '/agent');
                  },
                  iconData: FontAwesomeIcons.lightbulb,
                  changeColor: false,
                ),
                DrawerListTile(
                  text: 'About',
                  onTap: () {
                    Navigator.pushNamed(context, '/about');
                  },
                  iconData: FontAwesomeIcons.info,
                  changeColor: false,
                ),
                DrawerListTile(
                  text: 'Contact',
                  onTap: () {
                    Navigator.pushNamed(context, '/contact');
                  },
                  iconData: FontAwesomeIcons.phone,
                  changeColor: false,
                ),
                const Spacer(),
                DrawerListTile(
                  text: 'Sign Out',
                  onTap: () => authProvider.signOut(context: context),
                  iconData: Icons.logout,
                  changeColor: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
