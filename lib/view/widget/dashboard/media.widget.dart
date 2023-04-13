import 'package:MyCareer/controller/dashboard.controller.dart';
import 'package:MyCareer/core/constatnt/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class media extends StatelessWidget {
  const media({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<dashboardImp>(
      builder: (controller) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Visibility(
              visible: controller.userData.github == "" ? false : true,
              child: InkWell(
                onTap: () async {
                  await launchUrl(Uri.parse(controller.userData.github!));
                },
                child: Image.asset(
                  images.github,
                  width: 30,
                  height: 30,
                  fit: BoxFit.cover,
                ),
              )),
          Visibility(
              visible: controller.userData.github == "" ? false : true,
              child: const SizedBox(
                width: 10,
              )),
          Visibility(
            visible: controller.userData.behance == "" ? false : true,
            child: InkWell(
              onTap: () async {
                await launchUrl(Uri.parse(controller.userData.behance!));
              },
              child: Image.asset(
                images.behance,
                width: 30,
                height: 30,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Visibility(
              visible: controller.userData.behance == "" ? false : true,
              child: const SizedBox(
                width: 10,
              )),
          Image.asset(images.cv),
        ],
      ),
    );
  }
}
