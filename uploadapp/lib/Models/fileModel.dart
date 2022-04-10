import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';

List<FileModel> fileModelFromJson(String str) => List<FileModel>.from(json.decode(str).map((x) => FileModel.fromJson(x)));

String fileModelToJson(List<FileModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FileModel {
  FileModel({
    this.url,
    this.fileName,
    this.fileSize,
    this.uploadTime,
  });

  String? url;
  String? fileName;
  int? fileSize;
  DateTime? uploadTime;

  factory FileModel.fromJson(Map<String, dynamic> json) =>
      FileModel(url: json["url"], fileName: json["fileName"], fileSize: json["fileSize"], uploadTime: (json["uploadTime"] as Timestamp).toDate());

  Map<String, dynamic> toJson() => {
        "url": url,
        "fileName": fileName,
        "fileSize": fileSize,
        "uploadTime": uploadTime,
      };
}
