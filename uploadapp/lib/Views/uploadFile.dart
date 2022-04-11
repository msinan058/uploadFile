// ignore_for_file: file_names

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:uploadapp/Views/uploadButton.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              "Please clickt  button to Upluad any File Smaller than 1MB",
              style: Theme.of(context).textTheme.headline6,
            ),
            const UploadButton(buttonName: "any file under 1mb", fileType: FileType.any, maxSize: 1),
            Text(
              "Please clickt  button to Upluad image File Smaller than 5MB",
              style: Theme.of(context).textTheme.headline6,
            ),
            const UploadButton(buttonName: "İmage file under 5mb", fileType: FileType.image, maxSize: 5),
            Text(
              "Please clickt  button to Upluad Audio File Smaller than 3MB",
              style: Theme.of(context).textTheme.headline6,
            ),
            const UploadButton(buttonName: "Audio file under 3mb", fileType: FileType.audio, maxSize: 3)
          ],
        ),
      ),
    );
  }
}
