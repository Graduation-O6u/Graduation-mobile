import 'package:MyCareer/core/class/statusRequesr.class.dart';
import 'package:MyCareer/core/constatnt/rootes.dart';
import 'package:MyCareer/core/function/handelingResponse.dart';
import 'package:MyCareer/data/datasource/remote/signup.remote.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class signupController extends GetxController {
  signup();
  passwordVisible();
  consfirmPasswordVisible();

  changeShadowName();
  changeShadowEmail();
  changeShadowPassword();
  changeShadowConfirmPassword();

  backShadowName();
  backShadowEmail();
  backShadowPassword();
  backShadowConfirmPassword();

  ValidName();
  NotValidName();
  ValidEmail();
  NotValidEmail();

  ValidPassword();
  NotValidPassword();
  ValidConfirmPassword();
  NotValidConfirmPassword();

  pdfRequied();
  cvName(String value);

  changeCity(String val);
  changeJob(String val);

  falseMatch();
  trueMatch();

  jobsearch();
  getCitiesData();
  getJobsData();
  verify();
}

class signupControllerImp extends signupController {
  bool password = true;
  bool confirmPassword = true;
  double shdowName = -8;
  double shdowEmail = -8;
  double shdowPassword = -8;
  double shdowConfirmPassword = -8;
  bool Name = false;
  bool Email = false;
  bool Password = false;
  bool ConfirmPassword = false;
  String city = "Choose your city";
  String job = "Choose your job";
  String cv = "";
  bool match = false;
  signupGetCities SignupGetCities = signupGetCities(Get.find());
  signupGetjobs SignupGetJobs = signupGetjobs(Get.find());
  signupPost SignupPost = signupPost(Get.find());
  uploadFile UploadFile = uploadFile(Get.find());
  List jobs = [];
  List currentJobs = [];
  List cites = [];
  List currentCites = [];

  String nameValue = "";
  String emailValue = "";
  String passwordValue = "";
  String confirmPasswordValue = "";
  String cityId = "";
  String jobId = "";
  String cvUrl = "";
  String secret = "";
  late TextEditingController searchval;
  late TextEditingController searchcity;
  late TextEditingController code1;
  late TextEditingController code2;
  late TextEditingController code3;
  late TextEditingController code4;
  late TextEditingController code5;
  late TextEditingController forgetEmail = TextEditingController();

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late statusRequest cityStatusRequest,
      jobStatusRequest,
      StatusRequest,
      verifyStaus,
      cvRequest;

  verify() async {
    verifyStaus = statusRequest.loading;
    var response = await SignupPost.verify(
        code1.text + code2.text + code3.text + code4.text + code5.text, secret);
    verifyStaus = await handleingReposnr(response);

    print(verifyStaus);

    if (verifyStaus != statusRequest.success) {
      Get.defaultDialog(
        title: "${response["type"]}",
        middleText: "${response["message"]}",
        backgroundColor: Colors.white,
        titleStyle: TextStyle(color: Colors.red),
        middleTextStyle: TextStyle(color: Colors.black),
      );
    } else {
      if (statusRequest.success == verifyStaus) {
        Get.offNamed(AppRoute.login);
      } else {
        print(StatusRequest);
      }
    }
    Get.delete();
  }

  verify2() async {
    print("/*/*/**/*++98654");
    verifyStaus = statusRequest.loading;
    var response = await SignupPost.forgetVerify(
        code1.text + code2.text + code3.text + code4.text + code5.text, secret);
    verifyStaus = await handleingReposnr(response);

    print(verifyStaus);

    if (verifyStaus != statusRequest.success) {
      Get.defaultDialog(
        title: "${response["type"]}",
        middleText: "${response["message"]}",
        backgroundColor: Colors.white,
        titleStyle: TextStyle(color: Colors.red),
        middleTextStyle: TextStyle(color: Colors.black),
      );
    } else {
      if (statusRequest.success == verifyStaus) {
        secret = response["data"]["secret"];
        update();

        Get.toNamed(AppRoute.changePassword);
      } else {
        print(StatusRequest);
      }
    }
    Get.delete();
  }

  change() async {
    verifyStaus = statusRequest.loading;
    var response = await SignupPost.change(passwordValue, secret);
    verifyStaus = await handleingReposnr(response);

    print(verifyStaus);

    if (verifyStaus != statusRequest.success) {
      Get.defaultDialog(
        title: "${response["type"]}",
        middleText: "${response["message"]}",
        backgroundColor: Colors.white,
        titleStyle: TextStyle(color: Colors.red),
        middleTextStyle: TextStyle(color: Colors.black),
      );
    } else {
      if (statusRequest.success == verifyStaus) {
        Get.offNamed(AppRoute.login);
      } else {
        print(StatusRequest);
      }
    }

    Get.delete();
  }

  forget() async {
    verifyStaus = statusRequest.loading;
    var response = await SignupPost.forgetEmail(forgetEmail.text);

    verifyStaus = await handleingReposnr(response);

    if (verifyStaus != statusRequest.success) {
      Get.defaultDialog(
        title: "${response["type"]}",
        middleText: "${response["message"]}",
        backgroundColor: Colors.white,
        titleStyle: TextStyle(color: Colors.red),
        middleTextStyle: TextStyle(color: Colors.black),
      );
    } else {
      if (statusRequest.success == verifyStaus) {
        secret = response["data"]["secret"];
        update();

        Get.toNamed(AppRoute.verify2);
      } else {
        print(StatusRequest);
      }
    }
    Get.delete();
  }

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
  void dispose() {
    forgetEmail.clear();
    super.dispose();
  }

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

  createUser() async {
    if (cvUrl == "") {
      Get.defaultDialog(
        title: "Erroe",
        middleText: "upload Your cv",
        backgroundColor: Colors.white,
        titleStyle: TextStyle(color: Colors.red),
        middleTextStyle: TextStyle(color: Colors.black),
      );
    } else {
      StatusRequest = statusRequest.loading;
      print(
          "${nameValue} , ${emailValue} ,${passwordValue} , ${jobId} , ${cityId}");

      var response = await SignupPost.postData(nameValue.trim(),
          emailValue.trim(), passwordValue.trim(), jobId, cityId, cvUrl);
      print("dldldldldldldl");

      print(response["data"]);
      if (response["type"] == "Conflict" || response["type"] == "badRequest") {
        Get.defaultDialog(
          title: "Conflict",
          middleText: "${response["message"]}",
          backgroundColor: Colors.white,
          titleStyle: TextStyle(color: Colors.red),
          middleTextStyle: TextStyle(color: Colors.black),
        );
      } else {
        print("/////////////////////////////////////");
        secret = response["data"]["secret"];

        StatusRequest = await handleingReposnr(response);

        if (statusRequest.success == StatusRequest) {
          Get.toNamed(AppRoute.verify);
        } else {
          print(StatusRequest);
        }
      }
    }
    Get.delete();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    searchval = TextEditingController();
    searchcity = TextEditingController();
    code1 = TextEditingController();
    code2 = TextEditingController();
    code3 = TextEditingController();
    code4 = TextEditingController();
    code5 = TextEditingController();
    forgetEmail = TextEditingController();
    update();
    getCitiesData();
    getJobsData();
    super.onInit();
  }

  @override
  signup() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      await createUser();
    } else {
      print("not Valid");
    }
    // TODO: implement login
  }

  @override
  falseMatch() {
    // TODO: implement changeShadowName
    match = false;
    update();
  }

  @override
  trueMatch() {
    match = true;
    // TODO: implement changeShadowName
    update();
  }

  @override
  changeShadowName() {
    // TODO: implement changeShadowName
    shdowName = -25;
    update();
  }

  @override
  changeShadowEmail() {
    shdowEmail = -25;
    update();
  }

  @override
  changeShadowPassword() {
    shdowPassword = -25;

    update();
  }

  @override
  changeShadowConfirmPassword() {
    shdowConfirmPassword = -25;

    update();
  }

  @override
  backShadowName() {
    // TODO: implement backShadowName
    shdowName = -8;
    update();
  }

  @override
  backShadowEmail() {
    shdowEmail = -8;
    update();
  }

  @override
  backShadowPassword() {
    shdowPassword = -8;

    update();
  }

  @override
  backShadowConfirmPassword() {
    shdowConfirmPassword = -8;

    update();
  }

  @override
  passwordVisible() {
    // TODO: implement goToSignup
    password = !password;
    update();
  }

  @override
  consfirmPasswordVisible() {
    // TODO: implement goToSignup
    confirmPassword = !confirmPassword;
    update();
  }

  @override
  ValidName() {
    // TODO: implement validName
    if (!Name) {
      Name = true;
    }
    update();
  }

  @override
  NotValidName() {
    // TODO: implement NotValidName
    if (Name) {
      Name = false;
    }
    update();
  }

  @override
  ValidEmail() {
    // TODO: implement validName
    if (!Email) {
      Email = true;
    }
    update();
  }

  @override
  NotValidEmail() {
    // TODO: implement NotValidEmail
    if (Email) {
      Email = false;
    }
    update();
  }

  @override
  ValidPassword() {
    // TODO: implement validPassword
    if (!Password) {
      Password = true;
    }
    update();
  }

  @override
  NotValidPassword() {
    // TODO: implement NotValidPassword
    if (Password) {
      Password = false;
    }
    update();
  }

  @override
  ValidConfirmPassword() {
    // TODO: implement validConfirmPassword
    if (!ConfirmPassword) {
      ConfirmPassword = true;
    }
    update();
  }

  @override
  NotValidConfirmPassword() {
    // TODO: implement NotValidConfirmPassword
    if (ConfirmPassword) {
      ConfirmPassword = false;
    }
    update();
  }

  @override
  changeCity(String val) {
    // TODO: implement changeCity

    city = val;

    update();
  }

  @override
  changeJob(String val) {
    // TODO: implement changeCity

    job = val;

    update();
  }

  @override
  pdfRequied() {
    cv = "*pdf required";
    update();
  }

  @override
  cvName(String value) {
    cv = value;
    update();
  }

  @override
  jobsearch() {
    List x = [];
    if (searchval != "") {
      jobs.forEach((element) {
        if (element["title"].toString().startsWith(searchval.text)) {
          x.add(element);
        }
      });
      currentJobs = x;
    } else {
      currentJobs = jobs;
    }
    update();
  }

  @override
  citysearch() {
    // TODO: implement search
    List x = [];
    if (searchcity.text != "") {
      cites.forEach((element) {
        if (element["name"].toString().startsWith(searchcity.text)) {
          x.add(element);
        }
      });
      currentCites = x;
    } else {
      currentCites = cites;
    }
    update();
  }
}
