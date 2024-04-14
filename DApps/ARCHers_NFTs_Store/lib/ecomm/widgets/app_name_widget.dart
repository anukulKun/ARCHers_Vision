import 'package:flutter/material.dart';

import '../const/app_colors.dart';

class AppNameWidget extends StatelessWidget {
  const AppNameWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'ARchStore ',
          style: TextStyle(
            color: AppColors.kBlue,
            fontSize: 30,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          'STORE',
          style: TextStyle(
            color: AppColors.kGreen,
            fontSize: 30,
          ),
        ),
      ],
    );
  }
}
