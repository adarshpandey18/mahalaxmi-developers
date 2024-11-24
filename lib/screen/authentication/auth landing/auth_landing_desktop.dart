import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:mahalaxmi_developers/provider/auth_provider.dart';
import 'package:mahalaxmi_developers/utils/constants/colors/app_colors.dart';
import 'package:mahalaxmi_developers/utils/constants/strings/image_strings.dart';
import 'package:mahalaxmi_developers/utils/constants/strings/text_strings.dart';
import 'package:mahalaxmi_developers/widgets/auth_landing_button.dart';
import 'package:mahalaxmi_developers/widgets/custom_divider.dart';
import 'package:mahalaxmi_developers/widgets/icon_card.dart';
import 'package:provider/provider.dart';

class AuthLandingDesktop extends StatelessWidget {
  const AuthLandingDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 2,
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(ImageStrings.nightSideBuilding),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(192, 20, 32, 46),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.all(25),
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    TextStrings.authLandingScreen,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.cinzel(
                      color: AppColors.midnightBlue,
                      fontSize: 38,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Lottie.asset(
                    ImageStrings.buildingLottieAnimation,
                    repeat: true,
                    height: 300,
                  ),
                  const SizedBox(height: 30),
                  // Button Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AuthLandingButton(
                        text: 'Sign Up',
                        onTap: () =>
                            Navigator.pushReplacementNamed(context, '/sign_up'),
                        backgroundColor: null,
                      ),
                      const SizedBox(width: 20),
                      AuthLandingButton(
                        text: 'Sign In',
                        backgroundColor: null,
                        onTap: () =>
                            Navigator.pushReplacementNamed(context, '/sign_in'),
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
                      const SizedBox(
                        width: 10,
                      ),
                      IconCard(
                        text: 'Facebook',
                        icon: FontAwesomeIcons.facebook,
                        onTap: () {},
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      IconCard(
                        text: 'Twitter',
                        icon: FontAwesomeIcons.twitter,
                        onTap: () {},
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(
                      context,
                      '/admin_authentication',
                    ),
                    child: const Text(
                      'Are you an Admin?',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
