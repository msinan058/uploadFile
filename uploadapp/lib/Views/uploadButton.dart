// ignore_for_file: file_names

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:uploadapp/Services/FirebaseServices.dart';

class UploadButton extends StatelessWidget {
  final FileType fileType;
  final double maxSize;
  final String buttonName;
  const UploadButton({
    required this.buttonName,
    required this.fileType,
    required this.maxSize,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () async {
          var result = await FireStoreDBServices().fileUpload(fileType: fileType, maxsize: maxSize);
          if (!result) {
            showDialog(
                context: context,
                builder: ((context) => const AlertDialog(
                      title: Text("Error Size too Large"),
                    )));
          }
          
        },
        child: Text(buttonName));
  }
}
