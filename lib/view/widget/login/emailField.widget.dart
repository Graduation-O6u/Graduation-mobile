import 'package:MyCareer/controller/login.controller.dart';
import 'package:MyCareer/core/constatnt/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class emailField extends StatelessWidget {
  const emailField({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<loginControllerImp>(
      builder: (controller) => Padding(
        padding: const EdgeInsets.fromLTRB(1, 1, 1, 1),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: app_colors.secondText,
                blurRadius: 10,
                spreadRadius: -8,
                offset: Offset(-5, 5),
              ),
            ],
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: TextFormField(
            controller: controller.email,
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.always,
              contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 35),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              fillColor: Colors.white,
              suffixIcon: Icon(Icons.email_outlined),
              hintStyle: TextStyle(color: app_colors.secondText),
              filled: true,
              hintText: "Enter your Email",
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.white, width: 1)),
            ),
          ),
        ),
      ),
    );
  }
}
