import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/discord_list_tile.dart';

class CreateServer2 extends StatefulWidget {
  const CreateServer2({super.key});

  @override
  State<CreateServer2> createState() => _CreateServer2State();
}

class _CreateServer2State extends State<CreateServer2> {
  late TapGestureRecognizer tapGestureRecognizer;
  @override
  void initState() {
    super.initState();

    tapGestureRecognizer = TapGestureRecognizer()..onTap = () {};
  }

  @override
  void dispose() {
    super.dispose();
    tapGestureRecognizer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: Scaffold(
        backgroundColor: const Color(0xFF36393e),
        appBar: AppBar(
          toolbarHeight: 72,
          backgroundColor: const Color(0xFF36393e),
          elevation: 0,
          scrolledUnderElevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              const SizedBox(
                height: 4,
              ),
              Text(
                "Tell us more about your server",
                style: GoogleFonts.openSans(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                "In order to help you with your setup, is your new server for just a few friends or a larger community?",
                style: GoogleFonts.openSans(
                  color: const Color(0xFFb9bbbf),
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 32,
              ),
              Theme(
                data: ThemeData(
                  highlightColor: Colors.transparent,
                  splashColor: const Color.fromARGB(255, 69, 71, 76),
                  splashFactory: InkRipple.splashFactory,
                ),
                child: ListTileTheme(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  tileColor: const Color(0xFF2a2b2f),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DiscordListTile(
                          onTap: () {},
                          title: "For me and my friends",
                          svgPath: 'assets/images/local-community.svg'),
                      const SizedBox(
                        height: 8,
                      ),
                      DiscordListTile(
                          onTap: () {},
                          title: "For a club or community",
                          svgPath: 'assets/images/artists-creators.svg')
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              RichText(
                text: TextSpan(
                  style: GoogleFonts.openSans(
                    color: const Color(0xFFb9bbbf),
                    fontSize: 14,
                  ),
                  children: [
                    const TextSpan(text: "Not sure? You can "),
                    TextSpan(
                      text: "skip this question ",
                      style: GoogleFonts.openSans(
                        color: const Color(0xFF4ba8ee),
                      ),
                      recognizer: tapGestureRecognizer,
                    ),
                    const TextSpan(text: "for now."),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
