import 'package:MyCareer/controller/dashboard.controller.dart';
import 'package:MyCareer/core/constatnt/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class customText extends StatelessWidget {
  final String title;
  final String title2;
  final TextEditingController cont;

  final bool req;
  const customText(
      {super.key,
      required this.title,
      required this.req,
      required this.cont,
      required this.title2});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 35),
          child: Row(
            children: [
              Text(title),
              req
                  ? Text(
                      "*",
                      style: TextStyle(color: Colors.red[800]),
                    )
                  : const Text(""),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(1, 1, 1, 1),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.blue.withOpacity(0.5),
                  blurRadius: 10,
                  spreadRadius: -8,
                  offset: const Offset(-5, 5),
                ),
              ],
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: GetBuilder<dashboardImp>(
              builder: (controller) => TextFormField(
                controller: cont,
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 35),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                  fillColor: Colors.white,
                  hintStyle: const TextStyle(color: app_colors.secondText),
                  filled: true,
                  hintText: title2,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide:
                          const BorderSide(color: Colors.white, width: 1)),
                ),
              ),
            ),
          ),
        ),
        // upload(),
      ],
    );
  }
}
