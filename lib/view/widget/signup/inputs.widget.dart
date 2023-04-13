import 'package:MyCareer/controller/signup.controller.dart';
import 'package:MyCareer/core/constatnt/colors.dart';
import 'package:MyCareer/core/function/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class inputs extends GetView<signupControllerImp> {
  const inputs({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
        key: controller.formstate,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GetBuilder<signupControllerImp>(
              builder: (controller) => Padding(
                padding: EdgeInsets.fromLTRB(1, 1, 1, 1),
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: app_colors.secondText,
                        blurRadius: 10,
                        spreadRadius: controller.shdowName,
                        offset: Offset(-5, 5),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: TextFormField(
                    validator: ((value) {
                      if (validationInput(value!, "", 5, 30, "name") != "") {
                        controller.changeShadowName();
                        controller.NotValidName();
                        return validationInput(value, "", 5, 30, "name");
                      } else {
                        controller.ValidName();
                        controller.backShadowName();
                      }
                      return null;
                    }),
                    onChanged: (value) {
                      controller.nameValue = value;
                      return !value.isEmpty
                          ? controller.ValidName()
                          : controller.NotValidName();
                    },
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 35),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      fillColor: Colors.white,
                      suffixIcon: Icon(Icons.person),
                      hintStyle: TextStyle(color: app_colors.secondText),
                      filled: true,
                      hintText: "Enter your name",
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide:
                              BorderSide(color: Colors.white, width: 1)),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GetBuilder<signupControllerImp>(
              builder: (controller) => Padding(
                padding: EdgeInsets.fromLTRB(1, 1, 1, 1),
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: app_colors.secondText,
                        blurRadius: 10,
                        spreadRadius: controller.shdowEmail,
                        offset: Offset(-5, 5),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: TextFormField(
                    validator: ((value) {
                      if (validationInput(value!, "", 5, 30, "email") != "") {
                        controller.changeShadowEmail();
                        controller.NotValidEmail();

                        return validationInput(value, "", 5, 30, "email");
                      } else {
                        controller.ValidEmail();
                        controller.backShadowEmail();
                      }
                      return null;
                    }),
                    onChanged: (value) {
                      controller.emailValue = value;
                      return !value.isEmpty
                          ? controller.ValidEmail()
                          : controller.NotValidEmail();
                    },
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 35),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      fillColor: Colors.white,
                      suffixIcon: Icon(Icons.email),
                      hintStyle: TextStyle(color: app_colors.secondText),
                      filled: true,
                      hintText: "Enter your Email",
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide:
                              BorderSide(color: Colors.white, width: 1)),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GetBuilder<signupControllerImp>(
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
                      if (validationInput(value!, "", 8, 30, "password") !=
                          "") {
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
                          borderSide:
                              BorderSide(color: Colors.white, width: 1)),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GetBuilder<signupControllerImp>(
              builder: (controller) => Padding(
                padding: const EdgeInsets.fromLTRB(1, 1, 1, 1),
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: app_colors.secondText,
                        blurRadius: 10,
                        spreadRadius: controller.shdowConfirmPassword,
                        offset: Offset(-5, 5),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: TextFormField(
                    validator: ((value) {
                      if (validationInput(value!, controller.passwordValue, 8,
                              30, "confirmPassword") !=
                          "") {
                        controller.changeShadowConfirmPassword();
                        controller.NotValidConfirmPassword();

                        return validationInput(value, controller.passwordValue,
                            8, 30, "confirmPassword");
                      } else {
                        controller.ValidConfirmPassword();
                        controller.backShadowConfirmPassword();
                      }
                      return null;
                    }),
                    obscureText: controller.confirmPassword,
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 35),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      fillColor: Colors.white,
                      suffixIcon: controller.confirmPassword
                          ? IconButton(
                              icon: Icon(Icons.visibility_off),
                              onPressed: () =>
                                  controller.consfirmPasswordVisible(),
                            )
                          : IconButton(
                              icon: Icon(Icons.visibility),
                              onPressed: () =>
                                  controller.consfirmPasswordVisible(),
                            ),
                      hintStyle: TextStyle(color: app_colors.secondText),
                      filled: true,
                      hintText: "Confirm password",
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide:
                              BorderSide(color: Colors.white, width: 1)),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
