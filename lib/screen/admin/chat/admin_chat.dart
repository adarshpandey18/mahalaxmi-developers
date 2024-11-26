import 'package:flutter/material.dart';
import 'package:mahalaxmi_developers/screen/admin/chat/admin_chat_desktop.dart';
import 'package:mahalaxmi_developers/screen/admin/chat/admin_chat_mobile.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AdminChatScreen extends StatelessWidget {
  final String senderUID;
  final String senderEmail;
  final String receiverUID;

  final String receiverName;

  const AdminChatScreen(
      {super.key,
      required this.senderUID,
      required this.senderEmail,
      required this.receiverUID,
      required this.receiverName});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context) => AdminChatMobile(
        senderUID: senderUID,
        receiverUID: receiverUID,
        receiverName: receiverName,
        senderEmail: senderEmail,
      ),
      desktop: (context) => AdminChatDesktop(
        senderUID: senderUID,
        receiverUID: receiverUID,
        receiverName: receiverName,
        senderEmail: senderEmail,
      ),
    );
  }
}
