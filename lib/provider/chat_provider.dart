import 'package:flutter/material.dart';
import 'package:mahalaxmi_developers/models/agent.dart';
import 'package:mahalaxmi_developers/services/chat_service.dart';

class ChatProvider extends ChangeNotifier {
  ChatService chatService = ChatService();
  bool isLoading = false;
  List<Agent> agents = [];

  // getting agents from firestore
  Future<void> getAgents() async {
    isLoading = true;
    notifyListeners();

    try {
      agents = await chatService.getAgents();
    } catch (e) {
      throw 'Error occured $e';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  List<Agent> getAgentList() {
    return agents;
  }
}
