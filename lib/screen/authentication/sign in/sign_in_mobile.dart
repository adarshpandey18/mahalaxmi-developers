import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahalaxmi_developers/provider/auth_provider.dart';
import 'package:mahalaxmi_developers/utils/constants/colors/app_colors.dart';
import 'package:mahalaxmi_developers/widgets/auth_landing_button.dart';
import 'package:mahalaxmi_developers/widgets/custom_divider.dart';
import 'package:mahalaxmi_developers/widgets/icon_card.dart';
import 'package:provider/provider.dart';

class SignInMobile extends StatefulWidget {
  const SignInMobile({super.key});

  @override
  State<SignInMobile> createState() => _SignInMobileState();
}

class _SignInMobileState extends State<SignInMobile> {
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
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      body: authProvider.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Container(
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
                      const SizedBox(
                        height: 1,
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                          onTap: () => authProvider.forgotPassword(
                            context: context,
                            email: email.text,
                          ),
                          child: Text(
                            'Forgot Password ?',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(),
                            textAlign: TextAlign.right,
                          ),
                        ),
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
                                authProvider.signIn(
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
                      const SizedBox(height: 30),
                      // Divider with OR text
                      const CustomDivider(),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconCard(
                            text: 'Google',
                            icon: FontAwesomeIcons.google,
                            onTap: () {
                              authProvider.googleSignIn(context: context);
                            },
                          ),
                          const SizedBox(width: 10),
                          IconCard(
                            text: 'Facebook',
                            icon: FontAwesomeIcons.facebook,
                            onTap: () {},
                          ),
                          const SizedBox(width: 10),
                          IconCard(
                            text: 'Twitter',
                            icon: FontAwesomeIcons.twitter,
                            onTap: () {},
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t have an account?',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          GestureDetector(
                            onTap: () =>
                                Navigator.pushNamed(context, '/sign_up'),
                            child: Text(
                              ' Sign Up',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).primaryColor,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
