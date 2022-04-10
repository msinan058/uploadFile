import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:uploadapp/Models/fileModel.dart';
import 'package:uploadapp/Services/FirebaseServices.dart';

part 'listfiles_state.dart';

class ListfilesCubit extends Cubit<ListfilesState> {
  ListfilesCubit() : super(ListfilesInitial());

  List<FileModel> fileList = [];

  Future<void> getFileList() async {
    emit(ListfilesInitial());
    fileList = await FireStoreDBServices().getList();
    if (fileList.isNotEmpty) {
      emit(ListfilesLoaded(fileList));
    }
  }
}
 