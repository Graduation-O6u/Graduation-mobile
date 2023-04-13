import 'package:MyCareer/controller/signup.controller.dart';
import 'package:MyCareer/core/constatnt/images.dart';
import 'package:MyCareer/view/widget/forgetPassword/email.widget.dart';
import 'package:MyCareer/view/widget/forgetPassword/send.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class forgetPassword extends StatelessWidget {
  const forgetPassword({super.key});

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
                  "please enter your email address \n to recieve a verification code",
                  textAlign: TextAlign.center,
                ),
                email(),
                send(),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
