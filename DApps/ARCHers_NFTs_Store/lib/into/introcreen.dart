// import 'package:flutter/material.dart';
// import 'package:intro_slider/intro_slider.dart';
// import 'package:intro_slider/slide_object.dart';
// import 'package:mydapp/screens/nfthome_screen.dart';

// class IntroScreen extends StatefulWidget {
//   @override
//   _IntroScreenState createState() => _IntroScreenState();
// }

// class _IntroScreenState extends State<IntroScreen> {
//   List<Slide> slides = [
//     Slide(
//       title: 'Welcome to MyApp',
//       description: 'This is a demo app showcasing intro slider.',
//       backgroundColor: Colors.blue,
//       styleTitle: TextStyle(color: Colors.white, fontSize: 24.0),
//       styleDescription: TextStyle(color: Colors.white, fontSize: 16.0),
//       centerWidget: Icon(
//         Icons.account_circle,
//         size: 200,
//         color: Colors.white,
//       ),
//     ),
//     Slide(
//       title: 'Explore Features',
//       description: 'Discover the amazing features of our app.',
//       backgroundColor: Colors.green,
//       styleTitle: TextStyle(color: Colors.white, fontSize: 24.0),
//       styleDescription: TextStyle(color: Colors.white, fontSize: 16.0),
//       centerWidget: Icon(
//         Icons.explore,
//         size: 200,
//         color: Colors.white,
//       ),
//     ),
//     Slide(
//       title: 'Get Started',
//       description: 'Start using our app and enjoy!',
//       backgroundColor: Colors.orange,
//       styleTitle: TextStyle(color: Colors.white, fontSize: 24.0),
//       styleDescription: TextStyle(color: Colors.white, fontSize: 16.0),
//       centerWidget: Icon(
//         Icons.star,
//         size: 200,
//         color: Colors.white,
//       ),
//     ),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: IntroSlider(
//         slides: slides,
//         onDonePress: () {
//           // Navigate to the next screen when done button is pressed
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => MainScreen()),
//           );
//         },
//       ),
//     );
//   }
// }

