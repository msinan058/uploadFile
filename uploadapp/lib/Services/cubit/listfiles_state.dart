part of 'listfiles_cubit.dart';

@immutable
abstract class ListfilesState {}

class ListfilesInitial extends ListfilesState {}

class ListfilesLoaded extends ListfilesState {
  final List<FileModel> fileList;
  ListfilesLoaded(this.fileList);
   List<Object> get props => [fileList];
}
