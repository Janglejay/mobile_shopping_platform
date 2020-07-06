import 'package:dio/dio.dart';

Future getRequest(url, {Map args}) async {
  try {
    Response response;
    Dio dio = new Dio();
    if (args == null) {
      response = await dio.get(url);
    } else {
      //get用queryParameters
      response = await dio.get(url, queryParameters: args);
    }
    return response.data;
  } catch (e) {
    return print(e);
  }
}

Future postRequest(String url, {Map data}) async {
  Dio dio = new Dio();
  Response response;
  try {
    if (data == null) {
      response = await dio.post(url);
    } else {
      //post用data
      response = await dio.post(url, data: data);
    }
    print("================================================");
    print(response.data);
    return response.data;
  } catch (e) {
    print(e);
  }
}
