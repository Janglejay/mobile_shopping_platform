import 'package:dio/dio.dart';
import 'package:mobile_shopping_platform/convert/image_imformation_convert.dart';

main() {
  _getImages();
}

Future _getImages() async {
  Dio dio = new Dio();
  try {
    var response = await dio.get(getImfomations);
    print(response);
    print(response.statusCode);
    print(response.data);
    List ll = [
      {
        "image_url":
            "https://img.alicdn.com/tfs/TB19Kp.azMZ7e4jSZFOXXX7epXa-520-280.jpg_q90_.webp",
        "name": "image1"
      },
      {
        "image_url":
            "https://aecpm.alicdn.com/simba/img/TB183NQapLM8KJjSZFBSutJHVXa.jpg",
        "name": "image2"
      },
    ];
    var list = ImageList.fromJson(response.data['images']);
    print(list.imageList[0].name);
    print(response.data['images']);
    return response;
  } catch (e) {
    print(e);
  }
}
