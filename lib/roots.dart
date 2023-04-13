import 'package:MyCareer/core/constatnt/rootes.dart';
import 'package:MyCareer/core/middleware/homepage.dart';
import 'package:MyCareer/view/screen/changePassword.screen.dart';
import 'package:MyCareer/view/screen/dashboard.screen.dart';
import 'package:MyCareer/view/screen/editProfile.widget.dart';
import 'package:MyCareer/view/screen/forgetPassword.screen.dart';
import 'package:MyCareer/view/screen/login.screen.dart';
import 'package:MyCareer/view/screen/homeNav.screen.dart';
import 'package:MyCareer/view/screen/onBoarding.screen.dart';
import 'package:MyCareer/view/screen/signup.screen.dart';
import 'package:MyCareer/view/screen/verify.screen.dart';
import 'package:MyCareer/view/screen/verify2.screen.dart';
import 'package:MyCareer/view/widget/homepage/applay.widget.dart';
import 'package:MyCareer/view/widget/homepage/home/saved.widget.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: "/", page: () => OnBoarding(), middlewares: [
    MyMiddleWare(),
  ]),
  GetPage(name: AppRoute.login, page: () => const login()),
  GetPage(name: AppRoute.signup, page: () => const signup()),
  GetPage(name: AppRoute.forgetPassword, page: () => const forgetPassword()),
  GetPage(name: AppRoute.homepage, page: () => homepage()),
  GetPage(name: AppRoute.dashboard, page: () => const dashboard()),
  GetPage(name: AppRoute.editProfile, page: () => const editProfile()),
  GetPage(name: AppRoute.saved, page: () => const savedJobs()),
  GetPage(name: AppRoute.verify, page: () => const verify()),
  GetPage(name: AppRoute.verify2, page: () => const verify2()),
  GetPage(name: AppRoute.applay, page: () => const applayJob()),
  GetPage(name: AppRoute.changePassword, page: () => const changePassword()),
];
