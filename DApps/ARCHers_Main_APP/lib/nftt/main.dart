import 'package:flutter/material.dart';
import 'package:mydapp/nftt/screens/home_screen.dart';

// void main() {
//   runApp(const MyAppnft());
// }

class MyAppnft extends StatelessWidget {
  const MyAppnft({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'archers vision',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: const HomeScreen(),
    );
  }
}
