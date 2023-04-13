import 'package:MyCareer/controller/dashboard.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class profileImage extends StatelessWidget {
  const profileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 100,
        height: 100,
        child: GetBuilder<dashboardImp>(
          builder: (controller) => CircleAvatar(
            backgroundImage: NetworkImage(controller.img),
          ),
        ));
  }
}
