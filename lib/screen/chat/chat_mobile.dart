import 'package:flutter/material.dart';

class ChatMobileScreen extends StatelessWidget {
  final String senderUID;
  final String senderEmail;
  final String receiverUID;
  final String receiverName;
  const ChatMobileScreen(
      {super.key,
      required this.senderUID,
      required this.senderEmail,
      required this.receiverUID,
      required this.receiverName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(receiverName),
      ),
    );
  }
}
