import 'package:cloud_firestore/cloud_firestore.dart';

class Users {
  final String uid;
  final String name;
  final String email;
  final String password;

  Users(
      {required this.uid,
      required this.name,
      required this.email,
      required this.password});

  // Convert a document snapshot to an Agent
  factory Users.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Users(
      uid: data['uid'],
      name: data['name'],
      email: data['email'],
      password: data['password'],
    );
  }
}
