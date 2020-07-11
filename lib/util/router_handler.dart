import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobile_shopping_platform/pages/details_page.dart';

Handler detailsHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  int goodsId = params['id'].first as int;
  print('goodId is ${goodsId}');
  return DetailsPage(goodsId);
});