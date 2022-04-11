import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:uploadapp/Views/uploadFile.dart';
import 'package:uploadapp/Views/getAllFileList.dart';
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
    );
  }


}
