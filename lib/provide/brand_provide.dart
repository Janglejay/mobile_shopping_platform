import 'package:flutter/material.dart';
import 'package:mobile_shopping_platform/convert/brand_model.dart';

class BrandProvide with ChangeNotifier {
  List<Brands> _brandsList = [];
  //默认选中全部
  int _clickIndex = 0;
  //默认找第一页
  int _page = 1;

  get brandsList => _brandsList;
  set brandsList(List<Brands> list) {
    //每次点击大类都要清理，不然容易索引不存在
    _clickIndex = 0;
    _page = 1;

    //自己声明一个全部对象
    Brands all = Brands();
    all.brandName = "全部";
    if (list.length == 0) {
      all.categoryId = -1;
    } else {
      all.categoryId = list[0].categoryId;
    }
    _brandsList = [all];
    if (list.length != 0) _brandsList.addAll(list);
    notifyListeners();
  }

  get clickIndex => _clickIndex;
  set clickIndex(int cur) {
    print("=================${cur}");
    if (cur != _clickIndex) {
      _page = 1;
      print("=================changepage->${_page}");
    }
    _clickIndex = cur;
    notifyListeners();
  }

  get page => _page;
  set page(int cpage) {
    //不需要刷新组件，所以不通知
    _page = cpage;
    notifyListeners();
  }
}
