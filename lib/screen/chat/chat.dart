import 'package:flutter/cupertino.dart';
import 'package:mahalaxmi_developers/screen/chat/chat_desktop.dart';
import 'package:mahalaxmi_developers/screen/chat/chat_mobile.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ChatScreen extends StatelessWidget {
  final String senderUID;
  final String senderEmail;
  final String receiverUID;
  final String receiverName;

  const ChatScreen(
      {super.key,
      required this.senderUID,
      required this.senderEmail,
      required this.receiverUID,
      required this.receiverName});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context) => ChatMobileScreen(
        senderUID: senderUID,
        senderEmail: senderEmail,
        receiverUID: receiverUID,
        receiverName: receiverName,
      ),
      desktop: (context) => ChatDesktopScreen(
        senderUID: senderUID,
        senderEmail: senderEmail,
        receiverUID: receiverUID,
        receiverName: receiverName,
      ),
    );
  }
}
