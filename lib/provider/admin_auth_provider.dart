import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mahalaxmi_developers/widgets/alert_box.dart';

class AdminAuthProvider extends ChangeNotifier {
  bool isLoading = false;
  String? errorMessage;
  String? adminUID; // To hold the dynamic UID
  String? adminName; // To hold the dynamic name
  String? adminEmail; // To hold the dynamic email

  Future<void> signIn({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
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
        // Extract the admin details from the document
        var adminDoc = querySnapshot.docs.first;
        adminUID = adminDoc['uid']; // Get the document ID as UID
        adminName = adminDoc['name']; // Get the admin's name from the document
        adminEmail =
            adminDoc['email']; // Get the admin's email from the document

        // Successfully signed in
        errorMessage = 'Admin Sign In Successfully';

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Admin Sign In Successfully')),
        );

        // Navigate to the admin screen after successful login
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
