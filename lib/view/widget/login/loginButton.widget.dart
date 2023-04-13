import 'package:MyCareer/controller/login.controller.dart';
import 'package:MyCareer/core/constatnt/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class loginButton extends StatelessWidget {
  const loginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<loginControllerImp>(
      builder: (controller) => Container(
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
              controller.postData();
            },
            child: Text(
              "Log In",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            color: app_colors.primaryColor,
            textColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
