import 'package:MyCareer/core/constatnt/links.dart';
import 'package:MyCareer/core/constatnt/rootes.dart';
import 'package:MyCareer/data/model/sharedPrefrence.dart';
import 'package:MyCareer/data/model/user.model.dart';
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/datasource/remote/dashboard.remote.dart';

abstract class dashboard extends GetxController {
  getUserData();
  edit();
  pdfRequired();
  changePhoto(data);
}

class dashboardImp extends dashboard {
  userInfo userData = userInfo();
  dashboardRemote DashboardRemote = dashboardRemote(Get.find());

  String img = "";
  @override
  pdfRequired() {
    Get.defaultDialog(
      title: "Conflict",
      middleText: "photo required",
      backgroundColor: Colors.white,
      titleStyle: const TextStyle(color: Colors.red),
      middleTextStyle: const TextStyle(color: Colors.black),
    );

    update();
  }

  @override
  getUserData() async {
    await preference().getUserData().then((value) {
      List list = value;
      userData = list[0];
      img = userData.image!;
    });
    update();
  }

  @override
  changePhoto(data) async {
    final dio = Dio();
    var response = await dio.post(
      links.upload,
      data: data,
    );

    img = response.data["url"];
    final prefs = await SharedPreferences.getInstance();
    await DashboardRemote.editData(
      userData.name!,
      userData.github!,
      userData.behance!,
      userData.about!,
      userData.cityId!,
      userData.jobId!,
      userData.cv!,
      img,
    );
// Save an integer value to 'counter' key.
    preference().saveUserData(userInfo(
      id: userData.id,
      name: userData.name,
      image: img,
      email: userData.email,
      subTitle: userData.subTitle,
      accessToken: userData.accessToken,
      refreshToken: userData.refreshToken,
      createdAt: userData.createdAt,
      view: userData.view,
      about: userData.about,
      city: userData.city,
      cityId: userData.cityId,
      jobId: userData.jobId,
      github: userData.github,
      behance: userData.behance,
      cv: userData.cv,
      followers: userData.followers,
    ));
    update();
  }

  @override
  edit() async {
    Get.offNamed(AppRoute.editProfile);
  }

  @override
  void onInit() async {
    await getUserData();

    update();
    super.onInit();
  }
}
