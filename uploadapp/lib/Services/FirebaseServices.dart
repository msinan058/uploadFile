// ignore_for_file: file_names

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uploadapp/Models/fileModel.dart';

class FireStoreDBServices {
  FireStoreDBServices();

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<List<FileModel>> getList(FileType fileType) async {
    QuerySnapshot<Map<String, dynamic>> fileList = await firestore.collection(fileType.toString()).get();
    List<FileModel> fileModelList = [];
    for (var document in fileList.docs) {
      Map<String, dynamic> file = document.data();

      var fileModel = FileModel.fromJson(file);

      fileModelList.add(fileModel);
    }
    return fileModelList;
  }

  Future<bool> fileUpload({required double maxsize, required FileType fileType}) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: fileType);

    if (result != null) {
      PlatformFile file = result.files.first;
      String fileName = file.name;
      int size = file.size;
      if (size > maxsize * 1048576) return false; //1mb = 1048576 bit
      var imageRef = FirebaseStorage.instance.ref("files/$fileName");
      var task = imageRef.putFile(File(file.path!));
      task.whenComplete(() async {
        var url = await imageRef.getDownloadURL();
        Map<String, dynamic> fileInfo = <String, dynamic>{};
        fileInfo["fileName"] = fileName;
        fileInfo["fileSize"] = size;
        fileInfo["uploadTime"] = FieldValue.serverTimestamp();
        fileInfo["url"] = url;
        fileInfo["fileType"] = fileType.toString();
        await firestore.collection(fileType.toString()).add(fileInfo);
        return true;
      });
    }
    return true;
  }
}
