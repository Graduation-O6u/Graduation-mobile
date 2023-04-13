import 'package:MyCareer/core/class/statusRequesr.class.dart';
import 'package:MyCareer/core/constatnt/links.dart';
import 'package:MyCareer/core/constatnt/rootes.dart';
import 'package:MyCareer/core/function/handelingResponse.dart';
import 'package:MyCareer/core/services/myServices.dart';
import 'package:MyCareer/data/datasource/remote/dashboard.remote.dart';
import 'package:MyCareer/data/datasource/remote/signup.remote.dart';
import 'package:MyCareer/data/model/sharedPrefrence.dart';
import 'package:MyCareer/data/model/user.model.dart';
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class EditUser extends GetxController {
  getUserData();
  back();
  getCitiesData();
  getJobsData();
  jobsearch();
  citysearch();
  editUser();
  changeCity(String val, String id);
  changeJob(String val, String id);
  pdfRequired();
  changeCv(data);
}

class EditUserImp extends EditUser {
  userInfo userData = userInfo();
  dashboardRemote DashboardRemote = dashboardRemote(Get.find());

  late TextEditingController searchval;
  late TextEditingController searchcity;
  late TextEditingController name;
  late TextEditingController github;
  late TextEditingController behance;
  late TextEditingController about;

  signupGetjobs SignupGetJobs = signupGetjobs(Get.find());
  signupGetCities SignupGetCities = signupGetCities(Get.find());
  late statusRequest cityStatusRequest,
      jobStatusRequest,
      userStatusRequest,
      cvStatusRequest = statusRequest.static;

  String cityId = "";
  List currentCites = [];
  List cites = [];
  List jobs = [];
  String job = "Choose your job";
  String cv = "";
  String jobId = "";

  List currentJobs = [];
  String city = "Choose your city";
  MyServices myServices = Get.find();

  @override
  pdfRequired() {
    Get.defaultDialog(
      title: "Conflict",
      middleText: "pdfRequired",
      backgroundColor: Colors.white,
      titleStyle: const TextStyle(color: Colors.red),
      middleTextStyle: const TextStyle(color: Colors.black),
    );
    update();
  }

  @override
  changeCv(data) async {
    final dio = Dio();
    var response = await dio.post(
      links.upload,
      data: data,
    );
    cv = response.data['url'];
    cvStatusRequest = statusRequest.success;
    update();
  }

  @override
  editUser() async {
    userStatusRequest = statusRequest.loading;
    var response = await DashboardRemote.editData(
      name.text,
      github.text,
      behance.text,
      about.text,
      cityId,
      jobId,
      cv,
      userData.image!,
    );
    userStatusRequest = await handleingReposnr(response);

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
      if (statusRequest.success == userStatusRequest) {
        // Obtain shared preferences.
        final prefs = await SharedPreferences.getInstance();

// Save an integer value to 'counter' key.
        preference().saveUserData(userInfo(
          id: userData.id,
          name: name.text,
          image: userData.image,
          email: userData.email,
          subTitle: userData.subTitle,
          accessToken: userData.accessToken,
          refreshToken: userData.refreshToken,
          createdAt: userData.createdAt,
          view: userData.view,
          about: about.text,
          city: city,
          cityId: cityId,
          jobId: jobId,
          github: github.text,
          behance: behance.text,
          cv: cv,
          followers: userData.followers,
        ));
// Save an integer value to 'counter' key.
      }
    }
    update();
    Get.offNamed(AppRoute.dashboard);
  }

  @override
  void dispose() {
    name.dispose();
    behance.dispose();
    about.dispose();
    super.dispose();
  }

  @override
  back() async {
    Get.offNamed(AppRoute.dashboard);
  }

  @override
  changeCity(String val, String id) {
    city = val;
    cityId = id;
    update();
  }

  @override
  changeJob(String val, String id) {
    job = val;
    jobId = id;

    update();
  }

  @override
  getCitiesData() async {
    cityStatusRequest = statusRequest.loading;
    var response = await SignupGetCities.getData();

    cityStatusRequest = await handleingReposnr(response);

    if (statusRequest.success == cityStatusRequest) {
      cites = response["data"];
      currentCites = response["data"];
    }
    update();
    Get.delete();
  }

  @override
  getJobsData() async {
    jobStatusRequest = statusRequest.loading;
    var response = await SignupGetJobs.getData();
    jobStatusRequest = await handleingReposnr(response);

    if (statusRequest.success == jobStatusRequest) {
      jobs = response["data"];
      currentJobs = response["data"];
    }
    update();
    Get.delete();
  }

  @override
  jobsearch() {
    // TODO: implement search
    List x = [];
    if (searchval != "") {
      for (var element in jobs) {
        if (element["title"].toString().startsWith(searchval.text)) {
          x.add(element);
        }
      }
      currentJobs = x;
    } else {
      currentJobs = jobs;
    }
    update();
  }

  changeStatus() {
    cvStatusRequest = statusRequest.loading;
    update();
  }

  @override
  citysearch() {
    // TODO: implement search
    List x = [];
    if (searchcity.text != "") {
      for (var element in cites) {
        if (element["name"].toString().startsWith(searchcity.text)) {
          x.add(element);
        }
      }
      currentCites = x;
    } else {
      currentCites = cites;
    }
    update();
  }

  @override
  getUserData() async {
    await preference().getUserData().then((value) {
      List list = value;
      userData = list[0];
    });
    update();
  }

  @override
  void onInit() async {
    await getUserData();

    searchval = TextEditingController();
    searchcity = TextEditingController();
    name = TextEditingController(text: userData.name!);
    about = TextEditingController(text: userData.about!);
    github = TextEditingController(text: userData.github!);
    behance = TextEditingController(text: userData.behance!);
    city = userData.city!;
    job = userData.subTitle!;
    jobId = userData.jobId!;
    cityId = userData.cityId!;
    cv = userData.cv!;
    getCitiesData();
    getJobsData();
    update();
    // TODO: implement onInit
    super.onInit();
  }
}
