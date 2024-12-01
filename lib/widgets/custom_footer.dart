import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahalaxmi_developers/widgets/logo_widget.dart';

class CustomFooter extends StatelessWidget {
  const CustomFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // Background color of the footer
      color: Theme.of(context).primaryColor,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Footer Logo or Company Name (optional)
          Text(
            'Mahalaxmi Developers',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).secondaryHeaderColor,
                  fontFamily: GoogleFonts.cinzel().fontFamily,
                  fontWeight: FontWeight.normal,
                ),
          ),
          const SizedBox(height: 10),

          // Footer description or tagline (optional)
          Text(
            "Building Dreams, One Home at a Time",
            style: GoogleFonts.cinzel(
              color: Colors.white70,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 20),

          // Social Media Links (Icons)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(
                  FontAwesomeIcons.facebook,
                ),
                onPressed: () {
                  // Navigate to Facebook (Example URL)
                },
              ),
              IconButton(
                icon: const Icon(
                  FontAwesomeIcons.xTwitter,
                ),
                onPressed: () {
                  // Navigate to Twitter (Example URL)
                },
              ),
              IconButton(
                icon: const Icon(
                  FontAwesomeIcons.instagram,
                ),
                onPressed: () {
                  // Navigate to Instagram (Example URL)
                },
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Copyright information
          Text(
            "© 2024 Mahalaxmi Developers. All Rights Reserved.",
            style: GoogleFonts.cinzel(
              color: Colors.white54,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
