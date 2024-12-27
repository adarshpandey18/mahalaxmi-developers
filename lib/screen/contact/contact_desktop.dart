import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahalaxmi_developers/provider/auth_provider.dart';
import 'package:mahalaxmi_developers/utils/constants/size/app_size.dart';
import 'package:mahalaxmi_developers/utils/constants/strings/image_strings.dart';
import 'package:mahalaxmi_developers/utils/constants/strings/text_strings.dart';
import 'package:mahalaxmi_developers/utils/helper/helper_functions.dart';
import 'package:mahalaxmi_developers/widgets/custom_footer.dart';
import 'package:mahalaxmi_developers/widgets/desktop_navbar.dart';
import 'package:mahalaxmi_developers/widgets/info_with_icon.dart';
import 'package:provider/provider.dart';

class ContactDesktopScreen extends StatelessWidget {
  ContactDesktopScreen({super.key});
  final HelperFunctions hf = HelperFunctions();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 112.0, vertical: 12.0),
              child: Column(
                children: [
                  Center(
                    child: Column(
                      children: [
                        DesktopNavbar(
                          authProvider: authProvider,
                          currentPage: 'Contact',
                        ),
                        const SizedBox(
                          height: 75,
                        ),
                        Text(
                          TextStrings.companyName,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                height: 1,
                                fontFamily: GoogleFonts.cinzel().fontFamily,
                                fontSize: 64,
                              ),
                        ),
                        Text(
                          TextStrings.companySuffix,
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    height: 0.6,
                                    letterSpacing: 1.2,
                                    fontSize: 28,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Divider(thickness: 4),
                  const SizedBox(height: 80),
                  Container(
                    height: 500,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Theme.of(context).highlightColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 4,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(12),
                                bottomLeft: Radius.circular(12),
                              ),
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(
                                    ImageStrings.buildingUpFacingNight),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              children: [
                                Text(
                                  'CONTACT US',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayLarge!
                                      .copyWith(
                                        fontSize: AppSize.largeText + 3,
                                        fontFamily:
                                            GoogleFonts.cinzel().fontFamily,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                const SizedBox(height: 40),
                                Flexible(
                                  child: Text(
                                    TextStrings.contactMessage,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(),
                                    softWrap: true,
                                  ),
                                ),
                                const SizedBox(height: 40),
                                InfoWithIcon(
                                  function: () => hf.urlLauncher(
                                    url: TextStrings.addressLink,
                                  ),
                                  iconData: FontAwesomeIcons.locationPin,
                                  text: TextStrings.address,
                                ),
                                const SizedBox(height: 20),
                                InfoWithIcon(
                                  function: () => hf.launchPhoneNumber(
                                      number: TextStrings.phoneNumberLink),
                                  iconData: FontAwesomeIcons.phone,
                                  text: TextStrings.phoneNumber,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const CustomFooter(),
          ],
        ),
      ),
    );
  }
}
