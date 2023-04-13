import 'package:MyCareer/controller/signup.controller.dart';
import 'package:MyCareer/core/constatnt/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class create extends StatelessWidget {
  const create({super.key});

  @override
  Widget build(BuildContext context) {
    signupControllerImp controller = Get.put(signupControllerImp());
    return Container(
      child: Material(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(22.0)),
        elevation: 5.0,
        clipBehavior: Clip.antiAlias, // Add This
        shadowColor: app_colors.secondText,

        child: MaterialButton(
          minWidth: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 18),
          onPressed: () {
            controller.signup();
          },
          child: Text(
            "Create account",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          color: app_colors.primaryColor,
          textColor: Colors.white,
        ),
      ),
    );
  }
}
