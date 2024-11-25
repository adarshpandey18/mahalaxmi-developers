import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mahalaxmi_developers/provider/auth_provider.dart';
import 'package:mahalaxmi_developers/widgets/logo_widget.dart';
import 'package:mahalaxmi_developers/widgets/navbar_items.dart';

class DesktopNavbar extends StatelessWidget {
  const DesktopNavbar({
    super.key,
    required this.authProvider,
    required this.currentPage,
  });

  final AuthProvider authProvider;
  final String currentPage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(
          width: 15,
        ),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, '/home'),
          child: const LogoWidget(),
        ),
        Expanded(
          flex: 6,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NavbarItems(
                  text: 'Home', route: 'home', currentPage: currentPage),
              NavbarItems(
                  text: 'Categories',
                  route: 'categories',
                  currentPage: currentPage),
              NavbarItems(
                  text: 'Agents', route: 'agents', currentPage: currentPage),
              NavbarItems(
                  text: 'About', route: 'about', currentPage: currentPage),
              NavbarItems(
                  text: 'Contact', route: 'contact', currentPage: currentPage),
            ],
          ),
        ),
        CupertinoButton(
          onPressed: () => authProvider.signOut(context: context),
          minSize: 33,
          color: Theme.of(context).highlightColor,
          child: Text(
            'Sign Out',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}
