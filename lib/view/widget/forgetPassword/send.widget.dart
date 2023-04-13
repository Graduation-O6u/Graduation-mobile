import 'package:MyCareer/controller/signup.controller.dart';
import 'package:MyCareer/core/constatnt/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class send extends StatelessWidget {
  const send({super.key});

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
          padding: EdgeInsets.symmetric(horizontal: 130, vertical: 18),
          onPressed: () {
            return controller.forget();
          },
          child: Text(
            "Send",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          color: app_colors.primaryColor,
          textColor: Colors.white,
        ),
      ),
    );
  }
}
