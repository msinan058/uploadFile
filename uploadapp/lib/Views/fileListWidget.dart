// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:uploadapp/Models/fileModel.dart';
import 'package:url_launcher/url_launcher.dart';

class FileListWidget extends StatelessWidget {
  const FileListWidget({ Key? key , required this.list}) : super(key: key);
  final List<FileModel> list ;
  @override
  Widget build(BuildContext context) {
     return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return ListTile(
            isThreeLine: true,
            title: Text(list[index].fileName!, style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: RichText(
                text: TextSpan(children: [
              const TextSpan(text: "FileSize  ", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400)),
              TextSpan(text: list[index].fileSize.toString(), style: const TextStyle(color: Colors.black)),
            ])),
            trailing: Text(list[index].uploadTime.toString()),
            leading: IconButton(
                onPressed: () async {
                  await launch(list[index].url!);
                },
                icon: const Icon(
                  Icons.download,
                  color: Colors.green,
                )),
          );
        });
  }
}