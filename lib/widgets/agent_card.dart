import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahalaxmi_developers/models/agent.dart';

class AgentCard extends StatefulWidget {
  const AgentCard({
    super.key,
    required this.agent,
  });

  final Agent agent;

  @override
  State<AgentCard> createState() => _AgentCardState();
}

class _AgentCardState extends State<AgentCard> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => setState(() {
        isHovering = true;
      }),
      onExit: (event) => setState(() {
        isHovering = false;
      }),
      child: Card(
        color: isHovering
            ? Theme.of(context).primaryColorLight
            : Theme.of(context).secondaryHeaderColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              FontAwesomeIcons.solidUser,
              size: 150,
              color: isHovering
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).disabledColor,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              widget.agent.name,
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    fontFamily: GoogleFonts.cinzel().fontFamily,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
