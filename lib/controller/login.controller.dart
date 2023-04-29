import 'package:MyCareer/core/class/statusRequesr.class.dart';
import 'package:MyCareer/core/constatnt/rootes.dart';
import 'package:MyCareer/core/function/handelingResponse.dart';
import 'package:MyCareer/data/datasource/remote/login.remote.dart';
import 'package:MyCareer/data/model/sharedPrefrence.dart';
import 'package:MyCareer/data/model/user.model.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class loginController extends GetxController {
  //loginPost loginpost = loginPost(Get.find());
  toSignup();
  toForget();
  postData();
  changeRemenber();
  showPassword();
}

class loginControllerImp extends loginController {
  // -> to got to login
  loginRemote LoginRemote = loginRemote(Get.find());
  bool isshowpassword = false;

  late statusRequest StatusRequest = statusRequest.static;
  late TextEditingController email;
  late TextEditingController passwod;
  bool remember = false;
  @override
  void onInit() {
    email = TextEditingController();
    passwod = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    passwod.dispose();
    super.dispose();
  }

  @override
  toSignup() {
    email.clear();
    passwod.clear();
    remember = false;
    isshowpassword = false;
    Get.toNamed(AppRoute.signup);
  }

  @override
  toForget() {
    email.clear();
    passwod.clear();
    remember = false;
    isshowpassword = false;

    Get.toNamed(AppRoute.forgetPassword);
  }

  @override
  postData() async {
    StatusRequest = statusRequest.loading;
    var response = await LoginRemote.postData(
        email.text.trim(), passwod.text.trim(), remember);

    StatusRequest = await handleingReposnr(response);

    if (response["type"] == "Conflict" ||
        response["type"] == "IncorrectCredentials" ||
        response["type"] == "ValidationErr") {
      Get.defaultDialog(
        title: "Sorry",
        middleText: "${response["message"]}",
        backgroundColor: Colors.white,
        titleStyle: const TextStyle(color: Colors.red),
        middleTextStyle: const TextStyle(color: Colors.black),
      );
    } else {
      if (statusRequest.success == StatusRequest) {
        // Obtain shared preferences.
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool('login', true);
        preference().saveUserData(userInfo(
          id: response["data"]["user"]["id"],
          name: response["data"]["user"]["name"],
          image: response["data"]["user"]["image"],
          email: response["data"]["user"]["email"],
          subTitle: response["data"]["user"]["job"]["title"],
          accessToken: response["data"]["accessToken"],
          refreshToken: response["data"]["refreshToken"],
          createdAt: response["data"]["user"]["createdAt"],
          view: response["data"]["view"].toString(),
          about: response["data"]["user"]["aboutme"],
          city: response["data"]["city"],
          cityId: response["data"]["user"]["cityId"],
          jobId: response["data"]["user"]["jobId"],
          github: response["data"]["user"]["github"],
          behance: response["data"]["user"]["behance"],
          cv: response["data"]["user"]["cv"],
        ));

        Get.offAllNamed(AppRoute.homepage);
      }
    }
    update();
    // Get.delete();
  }

  @override
  changeRemenber() {
    remember = !remember;
    update();
  }

  @override
  showPassword() {
    isshowpassword = !isshowpassword;
    update();
  }
}
