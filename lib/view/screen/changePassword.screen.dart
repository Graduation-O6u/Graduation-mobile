import 'package:MyCareer/controller/signup.controller.dart';
import 'package:MyCareer/core/constatnt/images.dart';
import 'package:MyCareer/view/widget/forgetPassword/confirmPassword.widget.dart';
import 'package:MyCareer/view/widget/forgetPassword/password.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/forgetPassword/send4.widget.dart';

class changePassword extends StatelessWidget {
  const changePassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(signupControllerImp());

    return
        //color: Colors.white,
        SingleChildScrollView(
            child: ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height,
      ),
      child: Scaffold(
        body: GetBuilder<signupControllerImp>(
          builder: (controller) => Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  images.LoginImage1,
                  height: 300,
                  fit: BoxFit.fill,
                ),
                Text(
                  "Change Your password Now",
                  textAlign: TextAlign.center,
                ),
                password(),
                confirmPassword(),
                send4(),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
