import 'package:MyCareer/controller/editProfile.controller.dart';
import 'package:MyCareer/core/class/handllingdataview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class searchInput2 extends StatelessWidget {
  const searchInput2({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditUserImp>(
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
                      controller.changeJob(
                          controller.currentJobs[index]["title"],
                          controller.currentJobs[index]["id"]);
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
