import 'package:flutter/material.dart';
import '../models/image_model.dart';

class ListOfImages extends StatelessWidget {
  final List<ImageModel> images;
  ListOfImages(this.images);

  Widget build(context) {
    return ListView.builder(
      itemCount: images.length,
      itemBuilder: (context, index) {
        return Text('$images[index].url');
      },
    );
  }
}
