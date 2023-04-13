import 'package:MyCareer/controller/dashboard.controller.dart';
import 'package:MyCareer/view/widget/dashboard/bodyPerson2.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class person2 extends StatelessWidget {
  final String title;
  final bool ok;
  const person2({super.key, required this.title, required this.ok});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.blue.withOpacity(0.5),
          blurRadius: 10,
          spreadRadius: -8,
          offset: const Offset(-1, 5),
        ),
      ]),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          ok
              ? const bodyperson2()
              : GetBuilder<dashboardImp>(
                  builder: (controller) => Text(
                    controller.userData.about.toString(),
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      color: Color(0xff464545),
                      fontSize: 16,
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
