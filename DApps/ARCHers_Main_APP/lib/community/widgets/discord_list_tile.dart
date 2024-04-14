import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class DiscordListTile extends StatelessWidget {
  final void Function() onTap;
  final String title;
  final String svgPath;
  const DiscordListTile({
    super.key,
    required this.onTap,
    required this.title,
    required this.svgPath,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: SvgPicture.asset(
        svgPath,
      ),
      minLeadingWidth: 48,
      title: Text(
        title,
        style: GoogleFonts.openSans(
          color: const Color(0xFFdbdcde),
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      ),
      trailing: SvgPicture.asset(
        'assets/images/chevron-right.svg',
        colorFilter: const ColorFilter.mode(
          Color(0xFFb9babe),
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
