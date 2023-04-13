import 'package:MyCareer/controller/dashboard.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class bodyperson2 extends StatelessWidget {
  const bodyperson2({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<dashboardImp>(
      builder: (controller) => Column(
        children: [
          ListTile(
            title: Text(
              controller.userData.email.toString(),
              style: TextStyle(color: Color(0xff464545)),
            ),
            leading: Icon(Icons.email),
          ),
          ListTile(
            title: Text(
              controller.userData.city.toString(),
              style: TextStyle(color: Color(0xff464545)),
            ),
            leading: Icon(Icons.location_on),
          ),
        ],
      ),
    );
  }
}
