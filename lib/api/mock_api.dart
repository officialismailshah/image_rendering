import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:simple_project_for_images_rendering/models/albums.dart';
import 'package:simple_project_for_images_rendering/models/photos.dart';
import 'package:simple_project_for_images_rendering/models/posts.dart';

class JsonFakeApi {
  static Future<List<Posts>>? fetchPosts() async {
    final posts = <Posts>[];
    final source =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
// with jsonDecode method Ismail shah
    final data = jsonDecode(source.body);
    print(data);
    data.forEach((e) {
      posts.add(Posts.fromJson(e));
    });
    return posts;
  }

  static Future<List<Photos>>? fetchPhotos() async {
    final photos = <Photos>[];
    var response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
// with json.decode method Ismail shah
    var data = json.decode(response.body);
    print(data);
    data.forEach((e) {
      photos.add(Photos.fromJson(e));
    });
    return photos;
  }

  static Future<List<Albums>>? fetchAlbums() async {
    final photos = <Albums>[];
    var response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
// with json.decode method Ismail shah
    var data = json.decode(response.body);
    print(data);
    data.forEach((e) {
      photos.add(Albums.fromJson(e));
    });
    return photos;
  }
}
