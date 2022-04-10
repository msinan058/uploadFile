import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:uploadapp/Services/FirebaseServices.dart';
import 'package:uploadapp/Services/cubit/listfiles_cubit.dart';
import 'package:uploadapp/Views/HomePageView.dart';
import 'package:uploadapp/Views/uploadList.dart';
import 'package:uploadapp/FB/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Upload File Aplication'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  int selectedindex = 0;
  List<Widget> tabList = [];
  @override
  void initState() {
    tabList = [const HomePage(), const ListPage()];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.upload),
            label: "UPLOAD",
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(icon: const Icon(Icons.table_rows_rounded), label: "LİST", backgroundColor: Colors.red[400])
        ],
        type: BottomNavigationBarType.shifting,
        currentIndex: selectedindex,
        onTap: (index) {
          setState(() {
            selectedindex = index;
          });
        },
      ),
      body: tabList[selectedindex],
      floatingActionButton: FloatingActionButton(
        onPressed: ()  async{
       var result= await  FireStoreDBServices().fileUpload();
       if(!result){
         showDialog( context: context, builder: ((context) => const AlertDialog(title: Text("Error Size too Large"),)));       
       }
       context.read<ListfilesCubit>().getFileList();
        },
        tooltip: 'Upload',
        child: const Icon(Icons.upload_file_rounded),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  // uploadImage() async {
  //   ImagePicker imagePicker = ImagePicker();
  //   XFile? xFile = await imagePicker.pickImage(source: ImageSource.camera);
  //   var uuid = Uuid();
  //   var userUuid = uuid.v4();
  //   var imageRef = FirebaseStorage.instance.ref("user/$userUuid");
  //   var task = imageRef.putFile(File(xFile!.path));

  //   task.whenComplete(() async {
  //     var url = await imageRef.getDownloadURL();
  //     print(url);
  //     firestore.doc("users/3q0tji7oNnmnp58MrVBg").set({"profil_pic": url.toString()}, SetOptions(merge: true));
  //   });
  // }

}
