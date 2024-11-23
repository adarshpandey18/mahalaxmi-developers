import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahalaxmi_developers/utils/constants/size/app_size.dart';
import 'package:mahalaxmi_developers/utils/constants/strings/image_strings.dart';
import 'package:mahalaxmi_developers/utils/constants/strings/text_strings.dart';

class AboutDesktopScreen extends StatelessWidget {
  const AboutDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 12.0,
            horizontal: 112.0,
          ),
          child: Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Column(
                    children: [
                      Text(
                        TextStrings.companyName,
                        style:
                            Theme.of(context).textTheme.displayMedium!.copyWith(
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
                  height: 40,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          TextStrings.ownerName,
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(),
                        ),
                        Text(
                          TextStrings.ownerDescription,
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(),
                        ),
                        Text(
                          TextStrings.ownerQuote,
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: AppSize.bodyLargeText + 3,
                                  ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image(
                        fit: BoxFit.cover,
                        height: 450,
                        image: AssetImage(
                          ImageStrings.profileImage1,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 80,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image(
                        fit: BoxFit.cover,
                        height: 450,
                        image: AssetImage(
                          ImageStrings.profileImage2,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          TextStrings.coOwnerName,
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(),
                        ),
                        Text(
                          TextStrings.coOwnerDescription,
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(),
                        ),
                        Text(
                          TextStrings.coOwnerQuote,
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: AppSize.bodyLargeText + 3,
                                  ),
                        ),
                      ],
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
