import 'package:flutter/material.dart';

class orDiv extends StatelessWidget {
  const orDiv({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const Expanded(
            child: Divider(
          thickness: 1,
          color: Colors.black,
        )),
        const SizedBox(
          width: 10,
        ),
        const Text("Or"),
        const SizedBox(
          width: 10,
        ),
        const Expanded(
            child: Divider(
          thickness: 1,
          color: Colors.black,
        )),
      ],
    );
  }
}
