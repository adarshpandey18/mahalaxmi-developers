import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mahalaxmi_developers/models/agent.dart';
import 'package:mahalaxmi_developers/models/message.dart';
import 'package:mahalaxmi_developers/models/user.dart';

class ChatService {
  // getting list of agents
  Future<List<Agent>> getAgents() async {
    final querySnapShot =
        await FirebaseFirestore.instance.collection('admin').get();
    List<Agent> agentList =
        querySnapShot.docs.map((doc) => Agent.fromFirestore(doc)).toList();

    return agentList;
  }

  Future<List<Users>> getUser() async {
    final querySnapshot =
        await FirebaseFirestore.instance.collection('users').get();
    List<Users> userList =
        querySnapshot.docs.map((doc) => Users.fromFirestore(doc)).toList();
    return userList;
  }

  // sending messages
  Future<void> sendMessage({
    required String senderUID,
    required String senderEmail,
    required String receiverUID,
    required String message,
  }) async {
    Timestamp timeStamp = Timestamp.now();
    Message msg = Message(
        senderUID: senderUID,
        senderEmail: senderEmail,
        receiverUID: receiverUID,
        message: message,
        timeStamp: timeStamp);
    List<String> uid = [senderUID, receiverUID];
    uid.sort();
    String roomId = uid.join('_');

    try {
      // Adding message to Firestore
      await FirebaseFirestore.instance
          .collection('chat_rooms')
          .doc(roomId)
          .collection('messages')
          .add(msg.toMap());

      // Optionally, add a small delay to ensure data is written and available
      await Future.delayed(const Duration(milliseconds: 500));
    } catch (e) {
      print('Error sending message: $e');
    }
  }

  Stream<QuerySnapshot> getMessages({
    required String senderUID,
    required String receiverUID,
  }) {
    List<String> uid = [senderUID, receiverUID];
    uid.sort();
    String roomID = uid.join('_');

    return FirebaseFirestore.instance
        .collection('chat_rooms')
        .doc(roomID)
        .collection('messages')
        .orderBy('timeStamp', descending: false)
        .snapshots();
  }
}
