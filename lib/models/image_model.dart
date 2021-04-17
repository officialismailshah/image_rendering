class ImageModel {
  int id;
  String title;
  String url;
  ImageModel(this.id, this.title, this.url);
  ImageModel.fromJson(Map<String, dynamic> parsedJson) {
    this.id = parsedJson["id"];
    this.title = parsedJson["title"];
    this.url = parsedJson["url"];
  }
}
