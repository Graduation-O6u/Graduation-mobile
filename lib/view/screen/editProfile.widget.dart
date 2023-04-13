import 'package:MyCareer/controller/editProfile.controller.dart';
import 'package:MyCareer/view/widget/dashboard/customText.widget.dart';
import 'package:MyCareer/view/widget/dashboard/save.widget.dart';
import 'package:MyCareer/view/widget/editProfile/country2.dart';
import 'package:MyCareer/view/widget/editProfile/pdf.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class editProfile extends StatelessWidget {
  const editProfile({super.key});

  @override
  Widget build(BuildContext context) {
    EditUserImp controller = Get.put(EditUserImp());
    return Scaffold(
        appBar: AppBar(
          title: const Text("Edit Profile"),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            ),
            onPressed: () => controller.back(),
          ),
        ),
        body: SafeArea(
          //padding: EdgeInsets.all(35),
          child: Container(
              child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height,
              ),
              child: GetBuilder<EditUserImp>(
                builder: (controller) => Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          customText(
                            title: "Name",
                            req: true,
                            title2: "",
                            cont: controller.name,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          customText(
                            title: "Github",
                            req: false,
                            title2: "",
                            cont: controller.github,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          customText(
                            title: "Behance",
                            req: false,
                            title2: "",
                            cont: controller.behance,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          customText(
                            title: "About",
                            req: false,
                            title2: "",
                            cont: controller.about,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const country2(),
                          const SizedBox(
                            height: 20,
                          ),
                          const pdfReader(),
                          //  upload(),
                        ],
                      ),
                      const save(),
                    ],
                  ),
                ),
              ),
            ),
          )),
        ));
  }
}
