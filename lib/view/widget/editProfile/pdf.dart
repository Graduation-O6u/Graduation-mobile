import 'package:MyCareer/controller/editProfile.controller.dart';
import 'package:MyCareer/core/class/handllingdataview.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:dio/dio.dart';

class pdfReader extends StatelessWidget {
  const pdfReader({super.key});

  @override
  Widget build(BuildContext context) {
    final dio = Dio();
    dio.options.headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
    return GetBuilder<EditUserImp>(
        builder: (controller) => handlingView(
              StatusRequest: controller.cvStatusRequest,
              widget: SizedBox(
                width: double.infinity,
                height: 200,
                child: Stack(
                  children: [
                    SfPdfViewer.network(
                      controller.cv.toString(),
                    ),
                    Positioned(
                        right: 10,
                        child: IconButton(
                            onPressed: () async {
                              final result =
                                  await FilePicker.platform.pickFiles(
                                type: FileType.custom,
                                allowedExtensions: [
                                  'pdf',
                                ],
                              );

                              if (result != null) {
                                if (result.files.single.extension != "pdf") {
                                  controller.pdfRequired();
                                } else {
                                  uploadFile(file) async {
                                    controller.changeStatus();

                                    String fileName = file.path.split('/').last;

                                    FormData formData = FormData.fromMap({
                                      "file": await MultipartFile.fromFile(
                                        file.path,
                                        filename: fileName,
                                      ),
                                    });
                                    controller.changeCv(formData);
                                    // print(response.data["url"]);
                                  }

                                  await uploadFile(result.files.single);
                                }
                              }
                            },
                            icon: const Icon(
                              Icons.edit,
                              color: Colors.red,
                            )))
                  ],
                ),
              ),
            ));
  }
}
