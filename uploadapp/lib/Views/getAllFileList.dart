// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uploadapp/Services/cubit/listfiles_cubit.dart';
import 'package:uploadapp/Views/fileListWidget.dart';

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
            return Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
              const    Text("Any File List",style: TextStyle(color: Colors.red ,fontSize: 16),),
                  Expanded(child: FileListWidget(list: state.anyFileList)),
             const     Text("İmage File List",style: TextStyle(color: Colors.red ,fontSize: 16),),
                  Expanded(child: FileListWidget( list:state.imageFileList)),
              const    Text("Audio File List",style: TextStyle(color: Colors.red ,fontSize: 16),),
                  Expanded(child: FileListWidget(list:state.audioFileList)),
                ],
              ),
            );
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

  
}
