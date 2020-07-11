import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:mobile_shopping_platform/util/router_handler.dart';

class Routes {
  static const String root = '/';
  static const String detailsPage = '/detail';
  static void configureRoutes(Router router) {
    //找不到路由
    router.notFoundHandler =
        new Handler(handlerFunc: (BuildContext context, Map params) {
      print("路由没找到");
    });
    router.define(detailsPage, handler: detailsHandler);
  }
}
