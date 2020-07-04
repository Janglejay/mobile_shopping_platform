class ImageList {
  List<SingleImage> imageList;
  ImageList({this.imageList});
  factory ImageList.fromJson(List<dynamic> json) {
    List<SingleImage> imageList =
        json.map((e) => SingleImage.fromJson(e)).toList();
    return ImageList(imageList: imageList);
  }
}

class SingleImage {
  String name;
  String image_url;
  SingleImage({this.name, this.image_url});
  factory SingleImage.fromJson(Map<String, dynamic> json) {
    return SingleImage(name: json['name'], image_url: json['image_url']);
  }
}
