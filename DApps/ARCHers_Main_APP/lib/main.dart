import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'res/constants.dart';
import 'view/splash/splash_view.dart';
void main() {
  runApp(const MyAppt());
}
class MyAppt extends StatelessWidget {
  const MyAppt({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: bgColor,
        useMaterial3: true,
        textTheme: GoogleFonts.openSansTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white,)
            .copyWith(
          bodyText1: const TextStyle(color: bodyTextColor),
          bodyText2: const TextStyle(color: bodyTextColor),
        ),
      ),

      home: SplashView()
    );
  }
}


