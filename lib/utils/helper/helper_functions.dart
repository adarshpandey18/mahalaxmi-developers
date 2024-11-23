import 'package:url_launcher/url_launcher.dart';

class HelperFunctions {
  urlLauncher({required String url}) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  launchPhoneNumber({required String number}) async {
    var phoneNumber = 'tel:+ $number';
    if (await canLaunchUrl(Uri.parse(phoneNumber))) {
      await launchUrl(Uri.parse(phoneNumber));
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }
}
