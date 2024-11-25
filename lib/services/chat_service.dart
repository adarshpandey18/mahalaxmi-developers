import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mahalaxmi_developers/models/agent.dart';

class ChatService {
  Future<List<Agent>> getAgents() async {
    final querySnapShot =
        await FirebaseFirestore.instance.collection('admin').get();
    List<Agent> agentList =
        querySnapShot.docs.map((doc) => Agent.fromFirestore(doc)).toList();

    return agentList;
  }
}
