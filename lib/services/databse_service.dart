  import 'package:cloud_firestore/cloud_firestore.dart';
  import 'package:flutter/foundation.dart';

  class DatabaseService {
    saveUserData(String uid, String name, String email, String password) async {
      try {
        await FirebaseFirestore.instance.collection("users").doc(uid).set({
          'uid': uid,
          'name': name,
          'email': email,
          'password': password,
        });
      } catch (e) {
        if (kDebugMode) {
          print("Error saving user data: $e");
        }
      }
    }
  }
