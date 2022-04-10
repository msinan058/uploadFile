import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uploadapp/Models/fileModel.dart';
import 'package:uploadapp/Services/cubit/listfiles_cubit.dart';
import 'package:url_launcher/url_launcher.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ListfilesCubit()..getFileList(),
      child: BlocBuilder<ListfilesCubit, ListfilesState>(
        builder: (context, state) {
          if (state is ListfilesLoaded) {
            List<FileModel> list = state.fileList;
            return fileList(list);
          }
          if (state is ListfilesInitial) {
            return const Center(
                child: CircularProgressIndicator(
              backgroundColor: Colors.amber,
            ));
          }

          return Container();
        },
      ),
    );
  }

  ListView fileList(List<FileModel> list) {
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
