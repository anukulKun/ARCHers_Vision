import 'package:flutter/material.dart';

// import '../../../community/main.dart';
import '../../../community/main.dart';
import '../../../nftt/main.dart';
import '../../../view model/controller.dart';
import '../../../view model/responsive.dart';
import '../../../wallet/main.dart';
import 'navigation_button.dart';

class NavigationButtonList extends StatelessWidget {
  const NavigationButtonList({super.key});
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 200),
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: Row(
            children: [
              NavigationTextButton(
                  onTap: () {
                    controller.animateToPage(0,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn);
                  },
                  text: 'Home'),
              if (!Responsive.isLargeMobile(context))
                NavigationTextButton(onTap: () {}, text: 'About us'),
              NavigationTextButton(
                  onTap: () {
                    controller.animateToPage(1,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn);
                  },
                  text: 'Developer'),
              NavigationTextButton(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyAppnft()),
                  );
                },
                text: 'Nft nexus',
              ),
              NavigationTextButton(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyAppp()),
                  );
                },
                text: 'Wallet',
              ),
               NavigationTextButton(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyApptt()),
                  );
                },
                text: 'community',
              )
            ],
          ),
        );
      },
    );
  }
}
