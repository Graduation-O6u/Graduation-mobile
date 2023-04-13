import 'package:MyCareer/controller/dashboard.controller.dart';
import 'package:MyCareer/core/constatnt/colors.dart';
import 'package:MyCareer/core/constatnt/rootes.dart';
import 'package:MyCareer/view/widget/dashboard/changeImage.widget.dart';
import 'package:MyCareer/view/widget/dashboard/media.widget.dart';
import 'package:MyCareer/view/widget/dashboard/person2.widget.dart';
import 'package:MyCareer/view/widget/dashboard/personInformation.widget.dart';
import 'package:MyCareer/view/widget/dashboard/profileImage.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class dashboard extends StatelessWidget {
  const dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    dashboardImp controller = Get.put(dashboardImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: app_colors.primaryColor,
        shadowColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
          onPressed: () => Get.offNamed(AppRoute.homepage),
        ),
        title: const Center(
          child: Text(
            "Profile",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () => controller.edit(),
              icon: const Icon(
                Icons.edit,
                color: Colors.white,
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height - 85,
          ),
          child: SafeArea(
            child: Center(
              child: GetBuilder<dashboardImp>(
                builder: (controller) => Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        children: const [profileImage(), changeImage()],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        controller.userData.name.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 21),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xffF4F4F4),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text(
                          controller.userData.subTitle.toString(),
                          style: const TextStyle(color: Color(0xff9F9F9F)),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const media(),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const personInformation(
                              title1: "Ready",
                              title2: "For hired",
                              icon: Icon(
                                Icons.directions_run_sharp,
                                size: 40,
                              )),
                          personInformation(
                              title1: controller.userData.followers.toString(),
                              title2: "Views",
                              icon: const Icon(
                                Icons.group,
                                size: 40,
                              )),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const person2(title: "Personal Information", ok: true),
                      const SizedBox(
                        height: 20,
                      ),
                      const person2(title: "About", ok: false),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
