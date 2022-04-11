import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:meta/meta.dart';
import 'package:uploadapp/Models/fileModel.dart';
import 'package:uploadapp/Services/FirebaseServices.dart';

part 'listfiles_state.dart';

class ListfilesCubit extends Cubit<ListfilesState> {
  ListfilesCubit() : super(ListfilesLoading());

  List<FileModel> anyFileList = [];
  List<FileModel> imageFileList = [];
  List<FileModel> audioFileList = [];

  Future<void> getFileList() async {
    emit(ListfilesLoading());
    anyFileList = await FireStoreDBServices().getList(FileType.any);
        imageFileList = await FireStoreDBServices().getList(FileType.image);

    audioFileList = await FireStoreDBServices().getList(FileType.audio);

   
      emit(ListfilesLoaded(anyFileList,imageFileList,audioFileList,));
    
  }
}
 