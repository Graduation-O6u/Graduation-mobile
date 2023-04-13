import 'package:MyCareer/controller/login.controller.dart';
import 'package:MyCareer/core/constatnt/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class customSignup extends StatelessWidget {
  loginControllerImp controller = Get.put(loginControllerImp());
  customSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don’t have an account?",
          style: TextStyle(color: app_colors.secondText),
        ),
        InkWell(
          onTap: () => controller.toSignup(),
          child: Text(
            " Sign up",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
