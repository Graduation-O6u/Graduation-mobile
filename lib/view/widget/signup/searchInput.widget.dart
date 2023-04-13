import 'package:MyCareer/controller/signup.controller.dart';
import 'package:MyCareer/core/class/handllingdataview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class searchInput extends StatelessWidget {
  const searchInput({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<signupControllerImp>(
      builder: (controller) => Expanded(
        //    height: double.infinity,
        //  width: double.infinity,

        //  color: Colors.black,
        child: handlingView(
            StatusRequest: controller.jobStatusRequest,
            widget: ListView.builder(
                itemCount: controller.currentJobs.length,
                itemBuilder: ((context, index) {
                  return GestureDetector(
                    onTap: () {
                      controller.jobId = controller.currentJobs[index]["id"];

                      Navigator.pop(context);
                      controller
                          .changeJob(controller.currentJobs[index]["title"]);
                    },
                    child: Card(
                      child: ListTile(
                        title: Text(controller.currentJobs[index]["title"]),
                      ),
                    ),
                  );
                }))),
      ),
    );
  }
}
