import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahalaxmi_developers/provider/admin_auth_provider.dart';
import 'package:mahalaxmi_developers/utils/constants/colors/app_colors.dart';
import 'package:mahalaxmi_developers/widgets/auth_landing_button.dart';
import 'package:provider/provider.dart';

class AdminAuthenticationMobileScreen extends StatefulWidget {
  const AdminAuthenticationMobileScreen({super.key});

  @override
  State<AdminAuthenticationMobileScreen> createState() =>
      _AdminAuthenticationMobileScreenState();
}

class _AdminAuthenticationMobileScreenState
    extends State<AdminAuthenticationMobileScreen> {
  late TextEditingController email;
  late TextEditingController password;
  late final GlobalKey<FormState> _formKey;
  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    email = TextEditingController();
    password = TextEditingController();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  String? _emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the email';
    }
    return null;
  }

  String? _passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the password';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final _adminAuthProvider = Provider.of<AdminAuthProvider>(context);

    return Scaffold(
      body: _adminAuthProvider.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              padding: const EdgeInsets.all(25),
              height: double.infinity,
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Sign In',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.cinzel(
                        color: AppColors.midnightBlue,
                        fontSize: 38,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 30),
                    // Email Text Form Field
                    TextFormField(
                      controller: email,
                      validator: _emailValidator,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.email),
                        hintText: 'Enter your email here',
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Password Text Form Field
                    TextFormField(
                      controller: password,
                      validator: _passwordValidator,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.lock),
                        hintText: 'Enter your password here',
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AuthLandingButton(
                          text: 'Sign In',
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              // Handle signup logic
                              _adminAuthProvider.signIn(
                                email: email.text,
                                password: password.text,
                                context: context,
                              );
                            }
                          },
                          backgroundColor: null,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
