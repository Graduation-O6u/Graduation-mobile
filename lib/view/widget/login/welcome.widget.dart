import 'package:flutter/material.dart';

class welcome extends StatelessWidget {
  const welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Welcome Back",
          style: Theme.of(context).textTheme.headline1,
        ),
        SizedBox(
          width: 12,
        ),
        Icon(
          Icons.waving_hand_outlined,
        ),
      ],
    );
  }
}
