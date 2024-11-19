import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
