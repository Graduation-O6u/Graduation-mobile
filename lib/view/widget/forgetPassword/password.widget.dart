import 'package:MyCareer/controller/signup.controller.dart';
import 'package:MyCareer/core/constatnt/colors.dart';
import 'package:MyCareer/core/function/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class password extends StatelessWidget {
  const password({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<signupControllerImp>(
        builder: (controller) => Padding(
              padding: const EdgeInsets.fromLTRB(1, 1, 1, 1),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: app_colors.secondText,
                      blurRadius: 10,
                      spreadRadius: controller.shdowPassword,
                      offset: Offset(-5, 5),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: TextFormField(
                  validator: ((value) {
                    if (validationInput(value!, "", 8, 30, "password") != "") {
                      controller.changeShadowPassword();
                      controller.NotValidPassword();
                      return validationInput(value, "", 8, 30, "password");
                    } else {
                      controller.ValidPassword();
                      controller.backShadowPassword();
                    }
                    return null;
                  }),
                  obscureText: controller.password,
                  onChanged: (value) {
                    controller.passwordValue = value;

                    return !value.isEmpty
                        ? controller.ValidPassword()
                        : controller.NotValidPassword;
                  },
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 5, horizontal: 35),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    fillColor: Colors.white,
                    suffixIcon: controller.password
                        ? IconButton(
                            icon: Icon(Icons.visibility_off),
                            onPressed: () => controller.passwordVisible(),
                          )
                        : IconButton(
                            icon: Icon(Icons.visibility),
                            onPressed: () => controller.passwordVisible(),
                          ),
                    hintStyle: TextStyle(color: app_colors.secondText),
                    filled: true,
                    hintText: "Enter your password",
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.white, width: 1)),
                  ),
                ),
              ),
            ));
  }
}
