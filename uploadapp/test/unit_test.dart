import 'package:file_picker/file_picker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:uploadapp/Services/FirebaseServices.dart';

void main() {
  setUp(() async {});

  test('FileloadTEst', () async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image);

    List<String> imagePathArr = result!.files.single.path!.split(".");
    print("image's type  =  ${imagePathArr[imagePathArr.length-1]}");
    expect(result is FilePickerResult, true);
  });

  // test('Comunication page Message Dropdown Test', () async {
  //   var response = await customerService.getContactMessageTypes();
  //   expect(response is ApiResult<List<ContactMessageTypesModel>>, true);
  // });
}
