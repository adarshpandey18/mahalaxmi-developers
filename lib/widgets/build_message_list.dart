import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BuildMessageList extends StatelessWidget {
  final DocumentSnapshot doc;
  final String senderUID;

  BuildMessageList({super.key, required this.doc, required this.senderUID});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    bool isSender = data['senderUID'] == senderUID;

    return ListTile(
      title: Container(
        padding: const EdgeInsets.all(10),
        margin: EdgeInsets.only(
            left: isSender ? 50 : 10,
            right: isSender ? 10 : 50,
            top: 5,
            bottom: 5),
        decoration: BoxDecoration(
          color: isSender ? Colors.blue[200] : Colors.grey[300],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          data['message'],
          style: TextStyle(
            color: isSender ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
