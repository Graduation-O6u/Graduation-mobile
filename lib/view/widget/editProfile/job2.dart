import 'package:MyCareer/controller/editProfile.controller.dart';
import 'package:MyCareer/core/constatnt/colors.dart';
import 'package:MyCareer/view/widget/editProfile/searchInput.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class job2 extends StatelessWidget {
  const job2({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditUserImp>(
      builder: (controller) => Material(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(22.0)),
        elevation: 5.0,
        clipBehavior: Clip.antiAlias, // Add This
        shadowColor: app_colors.secondText,
        child: MaterialButton(
          minWidth: 140,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
          onPressed: () {
            showModalBottomSheet(
                backgroundColor: Colors.transparent,
                context: context,
                builder: (context) => FractionallySizedBox(
                        child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 20),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          )),
                      child: Column(
                        children: [
                          TextFormField(
                            onChanged: (value) => controller.jobsearch(),
                            controller: controller.searchval,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 35),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey)),
                              fillColor: Colors.white,
                              prefixIcon: Icon(Icons.search),
                              hintStyle:
                                  TextStyle(color: app_colors.secondText),
                              filled: true,
                              label: Text("Search"),
                              hintText: "Search",
                            ),
                          ),
                          const searchInput2(),
                        ],
                      ),
                    )));
          },
          color: Colors.white,
          textColor: app_colors.secondText,
          child: Row(
            children: [
              Text(
                controller.job.length > 13 &&
                        controller.job != "Choose your job"
                    ? "${controller.job.substring(0, 13)}.."
                    : controller.job,
                style: const TextStyle(
                    overflow: TextOverflow.ellipsis, fontSize: 11),
              ),
              const Icon(Icons.arrow_drop_down)
            ],
          ),
        ),
      ),
    );
  }
}
