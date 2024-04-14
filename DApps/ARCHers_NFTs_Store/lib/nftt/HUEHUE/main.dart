import 'package:flutter/material.dart';

import 'pages/login_page.dart';
import 'utils/routes.dart';

void main(List<String> args) {
  runApp(const NFTCheckerScreen());
}

class NFTCheckerScreen extends StatelessWidget {
  const NFTCheckerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: MyRoutes.loginRoute,
      routes: {
        MyRoutes.loginRoute: (context) => const LoginPage(),
      },
    );
  }
}
