import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/discord_list_tile.dart';
import 'server_2.dart';

class RemoveScrollGlowBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

class CreateServer extends StatefulWidget {
  const CreateServer({super.key});

  @override
  State<CreateServer> createState() => _CreateServerState();
}

class _CreateServerState extends State<CreateServer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF36393e),
      appBar: AppBar(
        backgroundColor: const Color(0xFF35383d),
        toolbarHeight: 72,
        leadingWidth: 36,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: SvgPicture.asset(
            'assets/images/close.svg',
            colorFilter: const ColorFilter.mode(
              Colors.white,
              BlendMode.srcIn,
            ),
          ),
        ),
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: IntrinsicHeight(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Color(0xFF35383d),
          ),
          child: Column(
            children: [
              Center(
                child: Text(
                  'Have an invite already?',
                  style: GoogleFonts.openSans(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Theme(
                data: ThemeData(
                  highlightColor: Colors.transparent,
                  splashColor: const Color.fromARGB(255, 94, 98, 102),
                  splashFactory: InkRipple.splashFactory,
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: RawMaterialButton(
                    elevation: 0,
                    focusElevation: 0,
                    highlightElevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    onPressed: () {},
                    fillColor: const Color(0xFF50555b),
                    child: Text(
                      "Join a Server",
                      style: GoogleFonts.openSans(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: ScrollConfiguration(
          behavior: RemoveScrollGlowBehavior(),
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 132),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 16,
                ),
                Center(
                  child: Text(
                    "Create Your Server",
                    style: GoogleFonts.openSans(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Center(
                  child: Text(
                    "Your server is where you and your friends hang out.",
                    style: GoogleFonts.openSans(
                      color: const Color(0xFFb9bbbf),
                      fontSize: 14,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    "Make yours and start talking.",
                    style: GoogleFonts.openSans(
                      color: const Color(0xFFb9bbbf),
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
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
                            onTap: () {
                              Navigator.of(context).push(_nextPage());
                            },
                            title: "Create My Own",
                            svgPath: 'assets/images/create-my-own.svg'),
                        const SizedBox(
                          height: 24,
                        ),
                        Text(
                          "START FROM A TEMPLATE",
                          style: GoogleFonts.openSans(
                            color: const Color(0xFFb9bbbf),
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        DiscordListTile(
                            onTap: () {
                              Navigator.of(context).push(_nextPage());
                            },
                            title: "Gaming",
                            svgPath: 'assets/images/gaming.svg'),
                        const SizedBox(
                          height: 8,
                        ),
                        DiscordListTile(
                            onTap: () {
                              Navigator.of(context).push(_nextPage());
                            },
                            title: "School Club",
                            svgPath: 'assets/images/school-club.svg'),
                        const SizedBox(
                          height: 8,
                        ),
                        DiscordListTile(
                            onTap: () {
                              Navigator.of(context).push(_nextPage());
                            },
                            title: "Study Group",
                            svgPath: 'assets/images/study-group.svg'),
                        const SizedBox(
                          height: 8,
                        ),
                        DiscordListTile(
                            onTap: () {
                              Navigator.of(context).push(_nextPage());
                            },
                            title: "Friends",
                            svgPath: 'assets/images/friends.svg'),
                        const SizedBox(
                          height: 8,
                        ),
                        DiscordListTile(
                            onTap: () {
                              Navigator.of(context).push(_nextPage());
                            },
                            title: "Artists & Creators",
                            svgPath: 'assets/images/artists-creators.svg'),
                        const SizedBox(
                          height: 8,
                        ),
                        DiscordListTile(
                            onTap: () {
                              Navigator.of(context).push(_nextPage());
                            },
                            title: "Local Community",
                            svgPath: 'assets/images/local-community.svg'),
                        const SizedBox(
                          height: 8,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Route _nextPage() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const CreateServer2(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1, 0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
