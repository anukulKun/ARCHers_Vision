import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../res/constants.dart';

class DownloadButton extends StatelessWidget {
  const DownloadButton({super.key});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        launchUrl(Uri.parse('https://anukuls-stellar-site.webflow.io/'));
      },
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: defaultPadding/1.5,horizontal: defaultPadding*2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
            boxShadow:const [
              BoxShadow(color: Colors.blue,offset: Offset(0, -1),blurRadius: 5),
              BoxShadow(color: Colors.red,offset: Offset(0, 1),blurRadius: 5),
            ],
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.pink,
                Colors.blue.shade900,
              ]),
        ),
        child: Row(
          children: [
            GestureDetector(
              onTap: () async {
                final url = 'https://anukuls-stellar-site.webflow.io/';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
              child: Row(
                children: [
                  Text(
                    'Checkout our website',
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: Colors.white,
                        letterSpacing: 1.2,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                  ),
                  const SizedBox(width: defaultPadding / 3),
                  const Icon(
                    FontAwesomeIcons.download,
                    color: Colors.white70,
                    size: 15,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
