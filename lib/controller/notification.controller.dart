import 'package:MyCareer/data/datasource/remote/home.remote.dart';

import 'package:get/get.dart';

abstract class notificationController extends GetxController {}

class notificationControllerImp extends notificationController {
  homeRemote HomeRemote = homeRemote(Get.find());

  @override
  void onInit() {
    super.onInit();
  }
}
