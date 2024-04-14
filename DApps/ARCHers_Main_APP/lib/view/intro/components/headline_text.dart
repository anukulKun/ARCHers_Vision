import 'package:flutter/material.dart';
class MyPortfolioText extends StatelessWidget {
  const MyPortfolioText({super.key, required this.start, required this.end});
  final double start;
  final double end;
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return TweenAnimationBuilder(
        tween: Tween(begin: start, end: end),
        duration: const Duration(milliseconds: 200),
        builder: (context, value, child) {
          return Container(
            width: MediaQuery.of(context).size.width - 80, // Limit width to prevent overflow
            child: Text(
              'Empowering dreams with cutting-edge \nVR technology,\nmaking the impossible affordable ',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    height: 0,
                    fontSize: 25,
                  ),
            ),
          );
        },
      );
    });
  }
}
