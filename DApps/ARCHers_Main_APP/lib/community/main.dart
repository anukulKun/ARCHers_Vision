import 'package:flutter/material.dart';

import 'pages/server.dart';

void main() {
  runApp(const MyApptt());
}

class MyApptt extends StatelessWidget {
  const MyApptt({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Discord',
      debugShowCheckedModeBanner: false,
      home: CreateServer(),
    );
  }
}
