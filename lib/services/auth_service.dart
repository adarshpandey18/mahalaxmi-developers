import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mahalaxmi_developers/services/databse_service.dart';
import 'package:mahalaxmi_developers/widgets/alert_box.dart';

class AuthService {
  final _databaseService = DatabaseService();

  // Sign Up user with email and passowrd
  signUp(
      {required String name,
      required String email,
      required String password,
      required BuildContext context}) async {
    try {
      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      // Saving user data to firestore
      await _databaseService.saveUserData(
          userCredential.user!.uid, name, email, password);
      // Scaffold Message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('User Registered Successfully')),
      );

      // navigation to home screen
      Navigator.pushReplacementNamed(context, '/home');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        AlertBox.alertBox(
          title: 'Email Already Exists',
          content: 'The provided email is already in use by an existing user.',
          buttonText: 'Try Again',
          function: () => {},
          context: context,
        );
      } else if (e.code == 'invalid-email') {
        AlertBox.alertBox(
          title: 'Invalid Email',
          content: 'The provided value for the email user property is invalid.',
          buttonText: 'Try Again',
          function: () => {},
          context: context,
        );
      } else if (e.code == 'weak-password') {
        AlertBox.alertBox(
          title: 'Weak Password',
          content: 'The password entered is too weak.',
          buttonText: 'Try Again',
          function: () => {},
          context: context,
        );
      }
    } catch (e) {
      AlertBox.alertBox(
        title: 'Exception',
        content: e.toString(),
        buttonText: 'Try Again',
        function: () => {},
        context: context,
      );
    }
  }

  signIn(String email, String password, BuildContext context) async {
    try {
      // signing in user with email and passowrd
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      // Scaffold Message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('User Sign In Successfully')),
      );

      // on successfull signing in the user will be redirected to home screen.
      Navigator.pushNamed(context, '/home');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        AlertBox.alertBox(
          title: 'User Not Found',
          content: 'There is no existing user record corresponding to $email.',
          buttonText: 'Try Again',
          function: () => {},
          context: context,
        );
      } else if (e.code == 'invalid-email') {
        AlertBox.alertBox(
          title: 'Invalid Email',
          content: 'The provided value for the email user property is invalid.',
          buttonText: 'Try Again',
          function: () => {},
          context: context,
        );
      } else if (e.code == 'wrong-password') {
        AlertBox.alertBox(
          title: 'Invalid Password',
          content: 'The password entered is invalid.',
          buttonText: 'Try Again',
          function: () => {},
          context: context,
        );
      } else if (e.code == 'invalid-credential') {
        AlertBox.alertBox(
          title: 'Incorrect email id or password',
          content: 'The enterd credentials is incorrect.',
          buttonText: 'Try Again',
          function: () => {},
          context: context,
        );
      } else {
        AlertBox.alertBox(
          title: 'Error',
          content: e.toString(),
          buttonText: 'Try Again',
          function: () => {},
          context: context,
        );
      }
    } catch (e) {
      AlertBox.alertBox(
        title: 'Exception',
        content: e.toString(),
        buttonText: 'Try Again',
        function: () => {},
        context: context,
      );
    }
  }

  signOut(BuildContext context) async {
    try {
      // signing out user
      await FirebaseAuth.instance.signOut();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('User Sign Out Successfully')),
      );

      Navigator.pushReplacementNamed(context, '/auth_landing');
    } catch (e) {
      AlertBox.alertBox(
        title: 'Exception',
        content: e.toString(),
        buttonText: 'Try Again',
        function: () => {},
        context: context,
      );
    }
  }

  forgotPassword(BuildContext context, String email) async {
    try {
      // sending forgot password link to the email
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      AlertBox.alertBox(
        title: 'Check your email',
        content: 'Password reset link has been sent to your email.',
        buttonText: 'Ok',
        function: () => {},
        context: context,
      );
    } catch (e) {
      AlertBox.alertBox(
        title: 'Exception',
        content: e.toString(),
        buttonText: 'Try Again`',
        function: () => {},
        context: context,
      );
    }
  }

  /// Sign Up method using Google
  googleSignIn({required BuildContext context}) async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      // Obtain the auth details
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      // Create an credentials
      final credentials = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      final userCredential =
          await FirebaseAuth.instance.signInWithCredential(credentials);
      // Scaffold Message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('User Sign In Successfully')),
      );

      // Saving user data to Firestore without password
      await _databaseService.saveUserData(
        userCredential.user!.uid,
        userCredential.user?.displayName ?? 'Google User',
        userCredential.user?.email ?? 'no-email@example.com',
        'Google User',
      );

      Navigator.pushNamed(context, '/home');
    } catch (e) {
      AlertBox.alertBox(
        title: 'Exception',
        content: e.toString(),
        buttonText: 'Try Again',
        function: () => {},
        context: context,
      );
    }
  }
}
