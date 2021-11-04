import 'package:flutter/material.dart';
import 'package:simple_project_for_images_rendering/api/mock_api.dart';
import 'view/main_screen.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatefulWidget {
  @override
  _MyappState createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  int counter = 0;

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          child: MainScreen(),
        ),
        appBar: AppBar(
          title: Text("Json Fake Api"),
        ),
      ),
    );
  }
}
