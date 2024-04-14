import 'package:archstore/ecomm/imports.dart';
import 'package:archstore/ecomm/view/home/home.dart';

import '../../widgets/app_name_widget.dart';

class Splash extends StatefulWidget {
  // const Splash({super.key});

  @override
  SplashState createState() => SplashState();
}

class SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2)).then((value) => getData());
  }

  getData() {
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => const Home()), (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(child: AppNameWidget()),
      ),
    );
  }
}
