import 'package:MyCareer/controller/login.controller.dart';
import 'package:MyCareer/core/constatnt/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class remember extends StatelessWidget {
  const remember({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<loginControllerImp>(
      builder: (controller) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Checkbox(
                value: controller.remember,
                onChanged: (value) {
                  controller.changeRemenber();
                },
              ),
              Text(
                "Remember for 30 days",
              ),
            ],
          ),
          InkWell(
            onTap: () => controller.toForget(),
            child: Text(
              "Forget password?",
              style: TextStyle(fontSize: 11, color: app_colors.secondText),
            ),
          ),
        ],
      ),
    );
  }
}
