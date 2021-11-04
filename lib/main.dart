import 'package:flutter/material.dart';
// <<<<<<< HEAD
import 'view/main_screen.dart';
// =======
import 'package:http/http.dart' as http;
import 'dart:convert';
// import 'view/list_of_images.dart';
// >>>>>>> 6de00ebbda8e76f5426f8a887cebbb0de7b6fbe2

void main() {
  runApp(Myapp());
}

class Myapp extends StatefulWidget {
  @override
  _MyappState createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  int counter = 0;

// <<<<<<< HEAD
// =======
  @override
  void initState() {
    super.initState();
    // fetchImages();
  }

  // void fetchImages() async {
  //   counter++;
  //   var response = await http
  //       .get(Uri.parse('https://jsonplaceholder.typicode.com/photos/$counter'));
  //   var url = json.decode(response.body);
  //   print('URL: ' + url.toString());
  //   var imageModel = new ImageModel.fromJson(url);
  //   print('Image Model: ' + imageModel.toString());
  //   setState(() {
  //     images.add(imageModel);
  //   });
  // }

// >>>>>>> 6de00ebbda8e76f5426f8a887cebbb0de7b6fbe2
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
