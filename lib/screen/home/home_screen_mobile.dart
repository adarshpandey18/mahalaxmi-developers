import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahalaxmi_developers/widgets/custom_drawer.dart';

class HomeScreenMobile extends StatelessWidget {
  const HomeScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MAHALAXMI DEVELOPERS'),
        titleTextStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontFamily: GoogleFonts.cinzel().fontFamily,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: FaIcon(
                FontAwesomeIcons.barsStaggered,
                size: 24,
                color: Theme.of(context).primaryColorLight,
              ),
            );
          },
        ),
      ),
      drawer: const CustomDrawer(),
    );
  }
}
