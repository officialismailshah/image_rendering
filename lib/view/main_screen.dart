import 'package:flutter/material.dart';
import 'package:simple_project_for_images_rendering/api/mock_api.dart';
import 'package:simple_project_for_images_rendering/models/albums.dart';
import 'package:simple_project_for_images_rendering/models/photos.dart';
import 'package:simple_project_for_images_rendering/models/posts.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Center(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Text('Posts'),
            ),
          ),
          FutureBuilder(
            future: JsonFakeApi.fetchPosts(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Posts>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              }
              return Container(
                height: 100,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Center(
                        child: Text(
                          snapshot.data![index].body!,
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
          Center(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Text('Photos'),
            ),
          ),
          FutureBuilder(
            future: JsonFakeApi.fetchPhotos(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Photos>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              }
              return Container(
                height: 200,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Image(
                        image:
                            NetworkImage(snapshot.data![index].thumbnailUrl!),
                      ),
                    );
                  },
                ),
              );
            },
          ),
          Center(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Text('Albums'),
            ),
          ),
          FutureBuilder(
            future: JsonFakeApi.fetchAlbums(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Albums>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              }
              return Container(
                height: 100,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Center(
                        child: Text(snapshot.data![index].title!),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
