import 'package:flutter/material.dart';
import 'package:mahalaxmi_developers/utils/constants/size/app_size.dart';
import 'package:mahalaxmi_developers/utils/constants/strings/image_strings.dart';
import 'package:mahalaxmi_developers/utils/constants/strings/text_strings.dart';
import 'package:mahalaxmi_developers/widgets/logo_widget.dart';

class AboutMobileScreen extends StatelessWidget {
  const AboutMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(child: LogoWidget()),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage(
                        ImageStrings.profileImage1,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  TextStrings.ownerName,
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(),
                ),
                Text(
                  TextStrings.ownerDescription,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(),
                ),
                Text(
                  TextStrings.ownerQuote,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: AppSize.bodyLargeText + 2,
                      ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage(
                        ImageStrings.profileImage2,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  TextStrings.coOwnerName,
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(),
                ),
                Text(
                  TextStrings.coOwnerDescription,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(),
                ),
                Text(
                  TextStrings.coOwnerDescription,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: AppSize.bodyLargeText + 2,
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
