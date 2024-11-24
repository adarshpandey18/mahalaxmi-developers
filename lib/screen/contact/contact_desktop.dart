import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahalaxmi_developers/utils/constants/size/app_size.dart';
import 'package:mahalaxmi_developers/utils/constants/strings/image_strings.dart';
import 'package:mahalaxmi_developers/utils/constants/strings/text_strings.dart';
import 'package:mahalaxmi_developers/utils/helper/helper_functions.dart';
import 'package:mahalaxmi_developers/widgets/info_with_icon.dart';

class ContactDesktopScreen extends StatelessWidget {
  ContactDesktopScreen({super.key});
  final HelperFunctions hf = HelperFunctions();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 112.0,
          vertical: 12.0,
        ),
        child: Column(
          children: [
            Center(
              child: Column(
                children: [
                  Text(
                    TextStrings.companyName,
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          height: 1,
                          fontFamily: GoogleFonts.cinzel().fontFamily,
                          fontSize: 64,
                        ),
                  ),
                  Text(
                    TextStrings.companySuffix,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          height: 0.6,
                          letterSpacing: 1.2,
                          fontSize: 28,
                        ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(
              thickness: 4,
            ),
            const SizedBox(
              height: 80,
            ),
            Container(
              height: 700,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Theme.of(context).highlightColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          bottomLeft: Radius.circular(12),
                        ),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            ImageStrings.buildingUpFacingNight,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
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
                                  fontFamily: GoogleFonts.cinzel().fontFamily,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Text(
                            TextStrings.contactMessage,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          InfoWithIcon(
                            function: hf.urlLauncher(
                                url: 'github.com/adarshpandey18/'),
                            iconData: FontAwesomeIcons.locationPin,
                            text: TextStrings.address,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          InfoWithIcon(
                            function: hf.launchPhoneNumber(
                                number: TextStrings.phoneNumer),
                            iconData: FontAwesomeIcons.phone,
                            text: TextStrings.phoneNumer,
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
    );
  }
}
