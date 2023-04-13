import 'package:MyCareer/controller/signup.controller.dart';
import 'package:MyCareer/core/constatnt/colors.dart';
import 'package:MyCareer/core/constatnt/links.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
//import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:mime_type/mime_type.dart';

class upload extends StatelessWidget {
  const upload({super.key});

  @override
  Widget build(BuildContext context) {
    final dio = Dio();
    dio.options.headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
    return Column(
      children: [
        GetBuilder<signupControllerImp>(
          builder: (controller) => MaterialButton(
            onPressed: () async {
              print("hi");

              final result = await FilePicker.platform.pickFiles(
                type: FileType.custom,
                allowedExtensions: [
                  'pdf',
                ],
              );

              if (result != null) {
                print(result.files.single.extension);
                if (result.files.single.extension != "pdf") {
                  controller.pdfRequied();
                } else {
                  print(
                      "--------------------------------------------------------------------------");
                  print(result.files.single);

                  uploadFile(file) async {
                    String fileName = file.path.split('/').last;
                    print(file.path);
                    print(fileName);
                    String mimeType = mime(fileName)!;
                    String mimee = mimeType.split('/')[0];
                    String type = mimeType.split('/')[1];

                    FormData formData = FormData.fromMap({
                      "file": await MultipartFile.fromFile(
                        file.path,
                        filename: fileName,
                      ),
                    });

                    var response = await dio.post(
                      links.upload,
                      data: formData,
                    );
                    controller.cvUrl = response.data["url"];
                    // print(response.data["url"]);
                  }

                  await uploadFile(result.files.single);
                  controller.cvName(result.files.single.name);
                }
              }
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(80.0)),
            padding: const EdgeInsets.all(0.0),
            child: Ink(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(80.0)),
                gradient: LinearGradient(
                    colors: <Color>[app_colors.primaryColor, Colors.white]),
              ),
              child: Container(
                constraints: const BoxConstraints(
                    maxWidth: 250.0,
                    minWidth: 50.0,
                    minHeight: 50.0), // min sizes for Material buttons
                alignment: Alignment.center,
                child: const Text(
                  'Upload your cv',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
        GetBuilder<signupControllerImp>(
            builder: (controller) => Text(
                  controller.cv,
                  style: TextStyle(
                      color: controller.cv == "*pdf required"
                          ? Colors.red
                          : app_colors.secondText),
                )),
      ],
    );
  }
}
