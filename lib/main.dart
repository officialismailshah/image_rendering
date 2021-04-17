import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'models/image_model.dart';
import 'view/list_of_images.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatefulWidget {
  @override
  _MyappState createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  List<ImageModel> images = [];
  int counter = 0;
  void fetchImages() async {
    counter++;
    var response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos/$counter'));
    var url = json.decode(response.body);
    print(url);
    var imageModel = new ImageModel.fromJson(url);
    print(imageModel);
    setState(() {
      images.add(imageModel);
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ListOfImages(images),
        floatingActionButton: FloatingActionButton(
          onPressed: fetchImages,
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          title: Text("Let's see the images by press button"),
        ),
      ),
    );
  }
}
