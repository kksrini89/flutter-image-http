class ImageModel {
  int id;
  String url;
  String title;

  ImageModel(this.id, this.title, this.url);
  ImageModel.fromJson(parsedJson) {
    this.id = parsedJson['id'];
    this.title = parsedJson['title'];
    this.url = parsedJson['url'];
  }
}
