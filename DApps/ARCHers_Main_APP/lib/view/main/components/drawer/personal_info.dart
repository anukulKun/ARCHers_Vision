import 'package:flutter/material.dart';

import '../../../../res/constants.dart';
import 'header_info.dart';

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: defaultPadding/2,),
        AreaInfoText(title: 'Contact', text: '9596055491'),
        AreaInfoText(title: 'Email', text: 'Archers69@gmail.com'),
        AreaInfoText(title: 'LinkedIn', text: '@Archers'),
        // AreaInfoText(title: 'Github', text: '@'),
        SizedBox(
          height: defaultPadding,
        ),
        Text('Tech stacks used',style: TextStyle(color: Colors.white),),
        SizedBox(
          height: defaultPadding,
        ),
      ],
    );
  }
}
