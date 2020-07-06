import 'package:flutter/material.dart';
import 'package:mobile_shopping_platform/convert/brand_model.dart';

class BrandProvide with ChangeNotifier {
  List<Brands> _brandsList = [];
  //默认选中全部
  int _clickIndex = 0;

  get brandsList => _brandsList;
  set brandsList(List<Brands> list) {
    //每次点击大类都要清理，不然容易索引不存在
    _clickIndex = 0;
    //自己声明一个全部对象
    Brands all = Brands();
    all.brandName = "全部";
    _brandsList = [all];
    _brandsList.addAll(list);
    notifyListeners();
  }

  get clickIndex => _clickIndex;
  set clickIndex(int cur) {
    _clickIndex = cur;
    notifyListeners();
  }
}
