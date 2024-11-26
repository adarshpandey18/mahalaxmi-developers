import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mahalaxmi_developers/models/agent.dart';
import 'package:mahalaxmi_developers/models/user.dart';
import 'package:mahalaxmi_developers/services/chat_service.dart';

class ChatProvider extends ChangeNotifier {
  ChatService chatService = ChatService();
  bool isLoading = false;
  List<Agent> agents = [];
  List<Users> users = [];

  // getting agents from firestore
  Future<void> getAgents() async {
    isLoading = true;
    // Notify listeners after the current frame build cycle
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });

    try {
      agents = await chatService.getAgents();
    } catch (e) {
      throw 'Error occurred $e';
    } finally {
      isLoading = false;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        notifyListeners();
      });
    }
  }

  Future<void> getUsers() async {
    isLoading = true;
    // Notify listeners after the current frame build cycle
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });

    try {
      users = await chatService.getUser();
    } catch (e) {
      throw 'Error occurred $e';
    } finally {
      isLoading = false;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        notifyListeners();
      });
    }
  }

  List<Agent> getAgentList() {
    return agents;
  }

  List<Users> getUsersLIst() {
    return users;
  }

  Future<void> sendMessage({
    required String senderUID,
    required String senderEmail,
    required String receiverUID,
    required String message,
  }) async {
    // Send the message using the ChatService
    await chatService.sendMessage(
      senderUID: senderUID,
      senderEmail: senderEmail,
      receiverUID: receiverUID,
      message: message,
    );

    // Notify listeners after sending the message
    notifyListeners();
  }

  Stream<QuerySnapshot> getMessages({
    required String senderUID,
    required String receiverUID,
  }) {
    return chatService.getMessages(
      senderUID: senderUID,
      receiverUID: receiverUID,
    );
  }
}
