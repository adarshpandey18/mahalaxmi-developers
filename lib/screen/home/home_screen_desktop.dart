import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahalaxmi_developers/provider/auth_provider.dart';
import 'package:mahalaxmi_developers/utils/constants/strings/image_strings.dart';
import 'package:mahalaxmi_developers/utils/constants/strings/text_strings.dart';
import 'package:mahalaxmi_developers/widgets/custom_footer.dart';
import 'package:mahalaxmi_developers/widgets/desktop_navbar.dart';
import 'package:provider/provider.dart';

class HomeScreenDesktop extends StatelessWidget {
  const HomeScreenDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  DesktopNavbar(
                    authProvider: authProvider,
                    currentPage: 'Home',
                  ),
                  const SizedBox(height: 30),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 800,
                        width: screenWidth,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                                ImageStrings.splashScreenImageDesktop),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Theme.of(context)
                              .dialogBackgroundColor
                              .withOpacity(0.8),
                        ),
                        padding: const EdgeInsets.all(30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              TextStrings.companyName,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                    fontSize: 84,
                                    fontFamily: GoogleFonts.cinzel().fontFamily,
                                    height: 0.7,
                                  ),
                            ),
                            Text(
                              TextStrings.companySuffix,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                    fontSize: 84,
                                    fontFamily: GoogleFonts.cinzel().fontFamily,
                                  ),
                            ),
                            Text(
                              TextStrings.companyTagline,
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                    color: Theme.of(context).primaryColorDark,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 34,
                                  ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth / 12,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              Text(
                                TextStrings.homeScreenDetail1Title,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                      fontFamily:
                                          GoogleFonts.cinzel().fontFamily,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                TextStrings.homeScreenDetail1Body,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      fontSize: 18,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 20),
                        Container(
                          height: 400,
                          width: screenWidth / 3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(ImageStrings.nightSideBuilding),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth / 12,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 400,
                          width: screenWidth / 3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(ImageStrings.nightSideBuilding),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              Text(
                                TextStrings.homeScreenDetail1Title,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                      fontFamily:
                                          GoogleFonts.cinzel().fontFamily,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                TextStrings.homeScreenDetail1Body,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      fontSize: 18,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            const CustomFooter(),
          ],
        ),
      ),
    );
  }
}
