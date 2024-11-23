import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mahalaxmi_developers/provider/auth_provider.dart';
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  width: 15,
                ),
                GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/home'),
                    child: const LogoWidget()),
                const Expanded(
                  flex: 6,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      NavbarItems(text: 'Home', route: 'home'),
                      NavbarItems(text: 'Categories', route: 'categories'),
                      NavbarItems(text: 'About', route: 'about'),
                      NavbarItems(text: 'Contact', route: 'Contact'),
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
            ),
            const SizedBox(
              width: 15,
            ),
          ],
        ),
      ),
    );
  }
}
