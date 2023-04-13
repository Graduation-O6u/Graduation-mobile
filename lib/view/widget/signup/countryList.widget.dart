import 'package:MyCareer/controller/signup.controller.dart';
import 'package:MyCareer/core/class/handllingdataview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

class countryList extends StatelessWidget {
  const countryList({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<signupControllerImp>(
      builder: (controller) => Expanded(
        //    height: double.infinity,
        //  width: double.infinity,

        //  color: Colors.black,
        child: handlingView(
            StatusRequest: controller.cityStatusRequest,
            widget: ListView.builder(
                itemCount: controller.currentCites.length,
                itemBuilder: ((context, index) {
                  return GestureDetector(
                    onTap: () {
                      KeyboardLockMode;
                      controller.cityId =
                          controller.currentCites[index]["code"];
                      Navigator.pop(context);
                      controller
                          .changeCity(controller.currentCites[index]["image"]);
                    },
                    child: Card(
                      child: ListTile(
                        trailing: SvgPicture.network(
                          controller.currentCites[index]["image"],
                        ),
                        title: Text(controller.currentCites[index]["name"]),
                      ),
                    ),
                  );
                }))),
      ),
    );
  }
}
