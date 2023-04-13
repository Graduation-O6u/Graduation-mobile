import 'package:MyCareer/controller/signup.controller.dart';
import 'package:MyCareer/core/constatnt/colors.dart';
import 'package:MyCareer/core/constatnt/images.dart';
import 'package:MyCareer/data/datasource/static/static.dart';
import 'package:MyCareer/view/widget/signup/country.widget.dart';
import 'package:MyCareer/view/widget/signup/create.widget.dart';
import 'package:MyCareer/view/widget/signup/getStarted.widget.dart';
import 'package:MyCareer/view/widget/signup/inputs.widget.dart';
import 'package:MyCareer/view/widget/signup/media.widget.dart';
import 'package:MyCareer/view/widget/signup/orDiv.widget.dart';
import 'package:MyCareer/view/widget/signup/upload.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:country_picker/country_picker.dart';

class signup extends StatelessWidget {
  const signup({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(signupControllerImp());

    return Scaffold(
      //    resizeToAvoidBottomInset: false,
      body: SafeArea(
        //padding: EdgeInsets.all(35),
        child: Container(
          height: double.infinity,
          margin: EdgeInsets.only(left: 40, right: 40, top: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                getStarted(),
                Text(
                  "Sing up with one of following options.",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(
                  height: 20,
                ),
                material(),
                SizedBox(
                  height: 20,
                ),
                orDiv(),
                SizedBox(
                  height: 20,
                ),
                inputs(),
                SizedBox(
                  height: 20,
                ),
                country(),
                SizedBox(
                  height: 20,
                ),
                upload(),
                create(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
