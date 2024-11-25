import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';

class FeatureContainer extends StatefulWidget {
  FeatureContainer({
    super.key,
    required this.text,
    required this.iconData,
    required this.route,
  });
  final String text;
  final IconData iconData;
  final String route;

  @override
  State<FeatureContainer> createState() => _FeatureContainerState();
}

class _FeatureContainerState extends State<FeatureContainer> {
  bool isHovering = false;
  bool isDesktop = true;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        isDesktop = sizingInformation.isDesktop;
        return GestureDetector(
          onTap: () => Navigator.pushNamed(context, widget.route),
          child: MouseRegion(
            onEnter: (event) {
              setState(() {
                isHovering = true;
              });
            },
            onExit: (event) {
              setState(() {
                isHovering = false;
              });
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                decoration: BoxDecoration(
                    color: isHovering
                        ? Theme.of(context).primaryColorLight
                        : Theme.of(context).secondaryHeaderColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        spreadRadius: 2,
                      )
                    ]),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Icon(
                        widget.iconData,
                        size: isDesktop ? 350 : 80,
                        color: Theme.of(context)
                            .iconTheme
                            .color!
                            .withOpacity(0.04),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        widget.text,
                        textAlign: TextAlign.center,
                        style: isDesktop
                            ? Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(
                                  fontFamily: GoogleFonts.cinzel().fontFamily,
                                )
                            : Theme.of(context).textTheme.bodyLarge!.copyWith(
                                  fontFamily: GoogleFonts.cinzel().fontFamily,
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
