import 'package:archstore/nftt/screens/home_screen.dart';
import 'package:flutter/material.dart';
class MyAppnft extends StatelessWidget {
  const MyAppnft({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NFTs',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: const HomeScreen(),
    );
  }
}
