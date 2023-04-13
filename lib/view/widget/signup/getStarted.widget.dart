import 'package:flutter/material.dart';

class getStarted extends StatelessWidget {
  const getStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Get Started",
          style: Theme.of(context).textTheme.headline1,
        ),
      ],
    );
  }
}
