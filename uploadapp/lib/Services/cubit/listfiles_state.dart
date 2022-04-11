part of 'listfiles_cubit.dart';

@immutable
abstract class ListfilesState {}

class ListfilesInitial extends ListfilesState {}

class ListfilesLoaded extends ListfilesState {
  final List<FileModel> anyFileList;
    final List<FileModel> imageFileList;

  final List<FileModel> audioFileList;

  ListfilesLoaded(this.anyFileList,this.imageFileList,this.audioFileList);
   List<Object> get props => [anyFileList,imageFileList,audioFileList];
}
