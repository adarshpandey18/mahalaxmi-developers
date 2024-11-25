import 'package:cloud_firestore/cloud_firestore.dart';

class Agent {
  final String uid;
  final String name;
  final String email;
  final String password;

  Agent(
      {required this.uid,
      required this.name,
      required this.email,
      required this.password});

  // Convert a document snapshot to an Agent
  factory Agent.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Agent(
      uid: data['uid'],
      name: data['name'],
      email: data['email'],
      password: data['password'],
    );
  }
}
