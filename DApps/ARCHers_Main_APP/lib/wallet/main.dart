import 'package:flutter/material.dart';
import 'package:mydapp/wallet/pages/login.dart';
import 'package:provider/provider.dart';
import 'providers/wallet_provider.dart';
import 'utils/routes.dart';

class MyAppp extends StatelessWidget {
  const MyAppp({Key? key}) : super(key: key);

  // Method to navigate to the main app screen
  static void navigateToMainApp(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(MyRoutes.loginRoute);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<WalletProvider>(
      create: (context) => WalletProvider(),
      builder: (context, _) {
        return MaterialApp(
          title: 'MyApp',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: Container(
            color: Colors.black, // Set background color to black
            child: const LoginPage(),
          ),
        );
      },
    );
  }
}
