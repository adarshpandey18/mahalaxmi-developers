import 'package:flutter/material.dart';
import 'package:mahalaxmi_developers/services/auth_service.dart';

class AuthProvider extends ChangeNotifier {
  final AuthService _authService = AuthService();
  bool isLoading = false;
  

  Future<void> signUp({
    required String name,
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    isLoading = true;
    notifyListeners();
    await _authService.signUp(
      name: name,
      email: email,
      password: password,
      context: context,
    );
    isLoading = false;
    notifyListeners();
  }

  Future<void> signIn({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    isLoading = true;
    notifyListeners();
    await _authService.signIn(email, password, context);
    isLoading = false;
    notifyListeners();
  }

  Future<void> signOut({
    required BuildContext context,
  }) async {
    isLoading = true;
    notifyListeners();
    await _authService.signOut(context);
    notifyListeners();
    isLoading = false;
    notifyListeners();
  }

  Future<void> googleSignIn({
    required BuildContext context,
  }) async {
    isLoading = true;
    notifyListeners();
    await _authService.googleSignIn(context: context);
    isLoading = false;
    notifyListeners();
  }

  Future<void> forogtPassowrd({required context, required email}) async {
    isLoading = true;
    notifyListeners();
    await _authService.forgotPassword(context, email);
    isLoading = false;
    notifyListeners();
  }
}
