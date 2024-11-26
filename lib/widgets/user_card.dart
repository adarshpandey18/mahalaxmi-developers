import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahalaxmi_developers/models/user.dart';
import 'package:mahalaxmi_developers/provider/admin_auth_provider.dart';
import 'package:mahalaxmi_developers/screen/admin/chat/admin_chat.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

class UserCard extends StatefulWidget {
  const UserCard({
    super.key,
    required this.user,
  });

  final Users user;

  @override
  State<UserCard> createState() => _AgentCardState();
}

class _AgentCardState extends State<UserCard> {
  bool isHovering = false;
  bool isDektop = false;

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AdminAuthProvider>(context);
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        isDektop = sizingInformation.isDesktop;
        return GestureDetector(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AdminChatScreen(
                  senderUID: authProvider.adminUID,
                  senderEmail: authProvider.adminEmail,
                  receiverName: widget.user.name,
                  receiverUID: widget.user.uid,
                ),
              )),
          child: MouseRegion(
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
                    size: isDektop ? 150 : 50,
                    color: isHovering
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).disabledColor,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    widget.user.name,
                    style: isDektop
                        ? Theme.of(context).textTheme.displayLarge!.copyWith(
                              fontFamily: GoogleFonts.cinzel().fontFamily,
                              fontWeight: FontWeight.bold,
                              color: isHovering
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context).disabledColor,
                            )
                        : Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontFamily: GoogleFonts.cinzel().fontFamily,
                              fontWeight: FontWeight.bold,
                              color: isHovering
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context).disabledColor,
                            ),
                  ),
                  Text(
                    widget.user.email,
                    style: isDektop
                        ? Theme.of(context).textTheme.displayMedium!.copyWith(
                              fontFamily: GoogleFonts.cinzel().fontFamily,
                              fontWeight: FontWeight.bold,
                              color: isHovering
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context).disabledColor,
                            )
                        : Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontFamily: GoogleFonts.cinzel().fontFamily,
                              fontWeight: FontWeight.bold,
                              color: isHovering
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context).disabledColor,
                            ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
