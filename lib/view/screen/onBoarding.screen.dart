import 'package:MyCareer/controller/onBoarding.controller.dart';
import 'package:MyCareer/view/widget/onBorading/customButton.widget.dart';
import 'package:MyCareer/view/widget/onBorading/dotController.widget.dart';
import 'package:MyCareer/view/widget/onBorading/skipText.widget.dart';
import 'package:MyCareer/view/widget/onBorading/slider.widger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoarding extends StatelessWidget {
  //const OnBoarding({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(onBoardingControllerImp());

    return Scaffold(
        body: Container(
      margin: EdgeInsets.only(
        top: 50,
      ),
      child: Column(
        children: [
          Expanded(
            child: slider_onBoarding(),
            flex: 3,
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                const dotController_onBoarding(),
                Spacer(),
                const customButton_onBoarding(),
                const skipText(),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
/*

      */