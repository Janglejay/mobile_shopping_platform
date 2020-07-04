import 'package:dio/dio.dart';
import 'package:mobile_shopping_platform/config/service_url.dart';

Future getHomePage() async {
  try {
    Response response;
    Dio dio = new Dio();
    response = await dio.get(getImfomations);
    return response.data;
  } catch (e) {
    return print(e);
  }
}
