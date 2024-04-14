import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLaunch {
  static Future<void> makePhoneCall({required String phoneNumber}) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  static Future<void> makeEmail({required String email, required String subject, required String body}) async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: email,
      queryParameters: {'subject': subject, 'body': body},
    );

    if (await canLaunch(params.toString())) {
      await launch(params.toString());
    } else {
      throw 'Could not launch ${params.toString()}';
    }
  }

  static Future<void> launchInBrowser({required String urlString}) async {
    final Uri url = Uri.parse(urlString);
    if (await canLaunch(url.toString())) {
      await launch(url.toString(),
          forceSafariVC: false,
          forceWebView: false,
          headers: <String, String>{'my_header_key': 'my_header_value'});
    } else {
      if (kDebugMode) {
        print('Error ${url.toString()}');
      }
      throw 'Could not launch $url';
    }
  }
}
