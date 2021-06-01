/// flutter run -d chrome --web-renderer html

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'models/image_model.dart';
// import 'view/list_of_images.dart';

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

  @override
  void initState() {
    super.initState();
    // fetchImages();
  }

  void fetchImages() async {
    counter++;
    var response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos/$counter'));
    var url = json.decode(response.body);
    print('URL: ' + url.toString());
    var imageModel = new ImageModel.fromJson(url);
    print('Image Model: ' + imageModel.toString());
    setState(() {
      images.add(imageModel);
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: ListView.builder(
              itemCount: images.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage('${images[index].url}.jpg'),
                  ),
                  // leading: Image(
                  //   image: NetworkImage(
                  //     '${images[index].url}.jpg',
                  //   ),
                  // ),
                  // leading: Image.network('${images[index].url}.jpg'),
                  title: Text('${images[index].title}'),
                );
              }),
        ),
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
