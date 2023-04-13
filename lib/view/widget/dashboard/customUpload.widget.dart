import 'package:MyCareer/core/constatnt/colors.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class customUpload extends StatelessWidget {
  const customUpload({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
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
          } else {}
          // print(result.files.single.name);
        }
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
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
    );
  }
}
