import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mahalaxmi_developers/widgets/alert_box.dart';

class AdminAuthProvider extends ChangeNotifier {
  bool isLoading = false;
  String? errorMessage;
  final String adminUID = "XyJA6IQovuSuF5smDtR6nlrEKgT2";
  final String adminName = "Admin1";
  final String adminEmail = "admin1@admin.com";
  Future<void> signIn(
      {required String email,
      required String password,
      required BuildContext context}) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      // Perform the query asynchronously and await the result
      var querySnapshot = await FirebaseFirestore.instance
          .collection('admin')
          .where('email', isEqualTo: email)
          .where('password', isEqualTo: password)
          .get();

      // Check if the admin is found
      if (querySnapshot.docs.isNotEmpty) {
        // Successfully signed in, do something (maybe notify)
        errorMessage = 'Admin Sign In Successfully';
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Admin Sign In Successfully')),
        );
        Navigator.pushReplacementNamed(context, '/admin');
      } else {
        errorMessage = 'Admin not found or incorrect password.';
        AlertBox.alertBox(
          title: 'Error',
          content: errorMessage!,
          buttonText: 'Try Again',
          function: () {},
          context: context,
        );
      }
    } catch (e) {
      AlertBox.alertBox(
        title: 'Exception Occurred',
        content: e.toString(),
        buttonText: 'Try Again',
        function: () {},
        context: context,
      );
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
