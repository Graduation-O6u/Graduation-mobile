import 'package:MyCareer/core/constatnt/colors.dart';
import 'package:flutter/material.dart';

class personInformation extends StatelessWidget {
  final String title1;
  final String title2;
  final Icon icon;
  const personInformation(
      {super.key,
      required this.title1,
      required this.title2,
      required this.icon});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2 - 50,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.blue.withOpacity(0.5),
          blurRadius: 10,
          spreadRadius: -8,
          offset: const Offset(-1, 5),
        ),
      ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Text(
                title1,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              Text(
                title2,
                style: const TextStyle(
                  color: app_colors.secondText,
                  fontSize: 11,
                ),
                textAlign: TextAlign.center,
              )
            ],
          )
        ],
      ),
    );
  }
}
