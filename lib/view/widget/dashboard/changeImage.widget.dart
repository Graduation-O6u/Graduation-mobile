import 'package:dio/dio.dart';
import 'package:MyCareer/controller/dashboard.controller.dart';
import 'package:MyCareer/core/constatnt/colors.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class changeImage extends StatelessWidget {
  const changeImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      child: Container(
        width: 35,
        height: 35,
        decoration: BoxDecoration(
            color: app_colors.primaryColor,
            borderRadius: BorderRadius.circular(50)),
        child: GetBuilder<dashboardImp>(
          builder: (controller) => Center(
            child: IconButton(
              icon: const Icon(
                Icons.camera_alt_outlined,
                color: Colors.white,
                size: 19,
              ),
              onPressed: () async {
                final result = await FilePicker.platform.pickFiles(
                  type: FileType.custom,
                  allowedExtensions: [
                    'png',
                  ],
                );

                if (result != null) {
                  if (result.files.single.extension != "png" &&
                      result.files.single.extension != "jpg") {
                    controller.pdfRequired();
                  } else {
                    uploadFile(file) async {
                      String fileName = file.path.split('/').last;

                      FormData formData = FormData.fromMap({
                        "file": await MultipartFile.fromFile(
                          file.path,
                          filename: fileName,
                        ),
                      });
                      controller.changePhoto(formData);
                      // print(response.data["url"]);
                    }

                    await uploadFile(result.files.single);
                  }
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
