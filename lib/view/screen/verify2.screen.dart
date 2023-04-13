import 'package:MyCareer/controller/signup.controller.dart';
import 'package:MyCareer/core/constatnt/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../widget/forgetPassword/send3.widget.dart';

class verify2 extends StatelessWidget {
  const verify2({super.key});

  @override
  Widget build(BuildContext context) {
    signupControllerImp controller = Get.put(signupControllerImp());

    return
        //color: Colors.white,
        Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
          ),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  images.LoginImage1,
                  height: 400,
                  fit: BoxFit.fill,
                ),
                GetBuilder<signupControllerImp>(
                  builder: (controller) => Text(
                    "please enter the code sent to \n ${controller.emailValue.trim()}",
                    textAlign: TextAlign.center,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 226, 226, 226),
                            blurRadius: 10,
                            spreadRadius: controller.shdowConfirmPassword,
                            offset: Offset(
                              -15,
                              10,
                            ),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: TextFormField(
                        controller: controller.code1,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          fillColor: Colors.white,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 1)),
                        ),
                      ),
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 226, 226, 226),
                            blurRadius: 10,
                            spreadRadius: controller.shdowConfirmPassword,
                            offset: Offset(
                              -15,
                              10,
                            ),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: TextFormField(
                        controller: controller.code2,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          fillColor: Colors.white,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 1)),
                        ),
                      ),
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 226, 226, 226),
                            blurRadius: 10,
                            spreadRadius: controller.shdowConfirmPassword,
                            offset: Offset(
                              -15,
                              10,
                            ),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: TextFormField(
                        controller: controller.code3,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          fillColor: Colors.white,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 1)),
                        ),
                      ),
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 226, 226, 226),
                            blurRadius: 10,
                            spreadRadius: controller.shdowConfirmPassword,
                            offset: Offset(
                              -15,
                              10,
                            ),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: TextFormField(
                        controller: controller.code4,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          fillColor: Colors.white,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 1)),
                        ),
                      ),
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 226, 226, 226),
                            blurRadius: 10,
                            spreadRadius: controller.shdowConfirmPassword,
                            offset: Offset(
                              -15,
                              10,
                            ),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: TextFormField(
                        controller: controller.code5,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          fillColor: Colors.white,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 1)),
                        ),
                      ),
                    ),
                  ],
                ),
                send3(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
