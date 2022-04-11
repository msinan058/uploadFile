import 'package:file_picker/file_picker.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() async {});

  test('Select File Test', () async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.any);
//select any file
    expect(result is FilePickerResult, true);
  });

  test('File type  Test', () async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image);
//select image
    List<String> imagePathArr = result!.files.single.path!.split(".");
    String fileType = imagePathArr[imagePathArr.length - 1];

    expect(fileType == "png" || fileType == "jpg", true);
  });
}
