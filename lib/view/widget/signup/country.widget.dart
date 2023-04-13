import 'package:MyCareer/controller/signup.controller.dart';
import 'package:MyCareer/core/constatnt/colors.dart';
import 'package:MyCareer/view/widget/signup/countryList.widget.dart';
import 'package:MyCareer/view/widget/signup/search.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
//import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class country extends StatelessWidget {
  const country({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GetBuilder<signupControllerImp>(
          builder: (controller) => Material(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22.0)),
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
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40),
                                topRight: Radius.circular(40),
                              )),
                          child: Column(
                            children: [
                              TextFormField(
                                onChanged: (value) {
                                  controller.citysearch();
                                },
                                controller: controller.searchcity,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 35),
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey)),
                                  fillColor: Colors.white,
                                  prefixIcon: Icon(Icons.search),
                                  hintStyle:
                                      TextStyle(color: app_colors.secondText),
                                  filled: true,
                                  label: Text("Search"),
                                  hintText: "Search",
                                ),
                              ),
                              countryList(),
                            ],
                          ),
                        )));
              },
              child: Row(
                children: [
                  controller.city.length > 15 &&
                          controller.city != "Choose your city"
                      ? SvgPicture.network(
                          controller.city,
                          height: 25,
                        )
                      : Text(
                          controller.city,
                          style: TextStyle(
                              overflow: TextOverflow.ellipsis, fontSize: 11),
                        ),
                  Icon(Icons.arrow_drop_down)
                ],
              ),
              color: Colors.white,
              textColor: app_colors.secondText,
            ),
          ),
        ),
        searchSignup(),
      ],
    );
  }
}
