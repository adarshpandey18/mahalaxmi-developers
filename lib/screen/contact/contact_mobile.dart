import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahalaxmi_developers/utils/constants/size/app_size.dart';
import 'package:mahalaxmi_developers/utils/constants/strings/text_strings.dart';
import 'package:mahalaxmi_developers/utils/helper/helper_functions.dart';
import 'package:mahalaxmi_developers/widgets/info_with_icon.dart';
import 'package:mahalaxmi_developers/widgets/logo_widget.dart';

class ContactMobileScreen extends StatelessWidget {
  ContactMobileScreen({super.key});
  HelperFunctions hf = HelperFunctions();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const LogoWidget(),
            const SizedBox(height: 30,),
            const Divider(
              endIndent: 20,
              indent: 20,
              thickness: 2,
            ),
            const SizedBox(
              height: 60,
            ),
            Text(
              'CONTACT US',
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    fontSize: AppSize.mediumText,
                    fontFamily: GoogleFonts.cinzel().fontFamily,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              TextStrings.contactMessage,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(),
            ),
            const SizedBox(
              height: 40,
            ),
            InfoWithIcon(
              function: () => hf.urlLauncher(url: TextStrings.addressLink),
              iconData: FontAwesomeIcons.locationPin,
              text: TextStrings.address,
            ),
            const SizedBox(
              height: 20,
            ),
            InfoWithIcon(
              function: () =>
                  hf.launchPhoneNumber(number: TextStrings.phoneNumberLink),
              iconData: FontAwesomeIcons.phone,
              text: TextStrings.phoneNumer,
            ),
          ],
        ),
      ),
    );
  }
}
