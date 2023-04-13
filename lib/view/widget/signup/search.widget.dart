import 'package:MyCareer/controller/signup.controller.dart';
import 'package:MyCareer/core/constatnt/colors.dart';
import 'package:MyCareer/view/widget/signup/searchInput.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class searchSignup extends StatelessWidget {
  const searchSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<signupControllerImp>(
      builder: (controller) => Material(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(22.0)),
        elevation: 5.0,
        clipBehavior: Clip.antiAlias, // Add This
        shadowColor: app_colors.secondText,
        child: MaterialButton(
          minWidth: 140,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
          onPressed: () {
            showModalBottomSheet(
                backgroundColor: Colors.transparent,
                context: context,
                builder: (context) => FractionallySizedBox(
                        child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      decoration: BoxDecoration(
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
                            decoration: InputDecoration(
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
                          searchInput(),
                        ],
                      ),
                    )));
          },
          child: Row(
            children: [
              Text(
                controller.job.length > 13 &&
                        controller.job != "Choose your job"
                    ? controller.job.substring(0, 13) + ".."
                    : controller.job,
                style: TextStyle(overflow: TextOverflow.ellipsis, fontSize: 11),
              ),
              Icon(Icons.arrow_drop_down)
            ],
          ),
          color: Colors.white,
          textColor: app_colors.secondText,
        ),
      ),
    );
  }
}
