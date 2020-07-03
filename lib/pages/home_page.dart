import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    getHttp();
    return Scaffold(
      body: Center(child: Text("首页")),
    );
  }

  void getHttp() async {
    try {
      Response response;
      response = await Dio().get("www.baidu.com");
      return print(response);
    } catch (e) {
      return print(e);
    }
  }
}
