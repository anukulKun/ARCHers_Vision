import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../themes.dart';

class CatelogHeader extends StatefulWidget {
  @override
  _CatelogHeaderState createState() => _CatelogHeaderState();
}

class _CatelogHeaderState extends State<CatelogHeader> {
  bool state = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'E - Shop',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: context.theme.canvasColor,
              ),
              textScaleFactor: 3,
            ),
            ChangeThemeButton()
          ],
        ),
        Text(
          'Trending products',
          style: TextStyle(
            color: context.theme.cardColor,
          ),
          textScaleFactor: 1.5,
        ),
      ],
    );
  }
}
