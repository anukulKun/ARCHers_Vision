import 'package:archstore/ecomm/imports.dart';
import 'package:flutter/material.dart';

import 'const/raw_string.dart';
import 'controller/cart_provider.dart';
import 'view/init_screen/splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const Store());
}

class Store extends StatelessWidget {
  const Store({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CartProvider>(create: (context) => CartProvider()),
      ],
      child: MaterialApp(
        title: RawString.appName,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          // Define your dark theme properties here
          // For example:
          scaffoldBackgroundColor: Colors.black,
          // Define more dark theme properties as needed
        ),
        home:  Splash(),
      ),
    );
  }
}
