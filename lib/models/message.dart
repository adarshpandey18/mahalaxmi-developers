import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String senderUID;
  final String senderEmail;
  final String receiverUID;
  final String message;
  final Timestamp timeStamp;

  Message({
    required this.senderUID,
    required this.senderEmail,
    required this.receiverUID,
    required this.message,
    required this.timeStamp,
  });

  Map<String, dynamic> toMap() {
    return {
      'senderUID': senderUID,
      'senderEmail': senderEmail,
      'receiverUID': receiverUID,
      'message': message,
      'timeStamp': timeStamp,
    };
  }
}
