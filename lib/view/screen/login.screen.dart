import 'package:MyCareer/controller/login.controller.dart';
import 'package:MyCareer/core/class/handllingdataview.dart';
import 'package:MyCareer/core/constatnt/colors.dart';
import 'package:MyCareer/core/constatnt/images.dart';
import 'package:MyCareer/data/datasource/static/static.dart';
import 'package:MyCareer/view/widget/login/customSignup.widget.dart';
import 'package:MyCareer/view/widget/login/emailField.widget.dart';
import 'package:MyCareer/view/widget/login/loginButton.widget.dart';
import 'package:MyCareer/view/widget/login/passwordField.widget.dart';
import 'package:MyCareer/view/widget/login/remeber.widget.dart';
import 'package:MyCareer/view/widget/login/welcome.widget.dart';
import 'package:MyCareer/view/widget/login/inputs.widget.dart';
import 'package:MyCareer/view/widget/signup/orDiv.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class login extends StatelessWidget {
  const login({super.key});

  @override
  Widget build(BuildContext context) {
    loginControllerImp controller = Get.put(loginControllerImp());

    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 40, right: 40),
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(images.LoginImage1),
                welcome(),
                Text(
                  "Log in with one of following options.",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                inputs(),
                orDiv(),
                emailField(),
                passwordField(),
                remember(),
                GetBuilder<loginControllerImp>(
                  builder: (controller) => handlingView(
                      StatusRequest: controller.StatusRequest,
                      widget: loginButton()),
                ),
                customSignup(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
