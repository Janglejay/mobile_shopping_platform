import 'package:flutter/material.dart';
import 'package:mobile_shopping_platform/convert/goods_model.dart';

class GoodsListProvide with ChangeNotifier {
  List<Goods> _goodsList = [];

  get goodsList => _goodsList;
  //点击大类时更换商品列表
  set goodsList(List<Goods> list) {
    _goodsList = list;
    notifyListeners();
  }
}
