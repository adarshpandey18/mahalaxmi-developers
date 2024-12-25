import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mahalaxmi_developers/provider/chat_provider.dart';
import 'package:mahalaxmi_developers/widgets/build_message_list.dart';
import 'package:mahalaxmi_developers/widgets/icon_card.dart';
import 'package:provider/provider.dart';

class AdminChatDesktop extends StatefulWidget {
  final String senderUID;
  final String senderEmail;
  final String receiverUID;
  final String receiverName;
  const AdminChatDesktop(
      {super.key,
      required this.senderUID,
      required this.receiverUID,
      required this.receiverName,
      required this.senderEmail});

  @override
  State<AdminChatDesktop> createState() => _AdminChatDesktopState();
}

class _AdminChatDesktopState extends State<AdminChatDesktop> {
  late final TextEditingController textController;
  FocusNode myFocusNode = FocusNode();
  @override
  void initState() {
    textController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final chatProvider = Provider.of<ChatProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.receiverName),
      ),
      body: Column(
        children: [
          StreamBuilder(
            stream: chatProvider.getMessages(
                senderUID: widget.senderUID, receiverUID: widget.receiverUID),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (snapshot.connectionState == ConnectionState.none) {
                return const Center(
                  child: Text('No messages to display.'),
                );
              }

              if (snapshot.hasData && snapshot.data!.docs.isEmpty) {
                return const Center(
                  child: Text('No messages yet.'),
                );
              }

              return Expanded(
                flex: 9,
                child: ListView(
                  children: snapshot.data!.docs
                      .map(
                        (doc) => BuildMessageList(
                          doc: doc,
                          senderUID: widget.senderUID,
                        ),
                      )
                      .toList(),
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: textController,
                    decoration: const InputDecoration(
                      hintText: 'Type a message...',
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                IconCard(
                  icon: FontAwesomeIcons.solidPaperPlane,
                  onTap: () async {
                    await chatProvider.sendMessage(
                      message: textController.text,
                      receiverUID: widget.receiverUID,
                      senderEmail: widget.senderEmail,
                      senderUID: widget.senderUID,
                    );

                    textController.clear();
                  },
                  text: 'Send',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
