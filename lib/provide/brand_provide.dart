import 'package:flutter/material.dart';
import 'package:mobile_shopping_platform/config/service_url.dart';
import 'package:mobile_shopping_platform/convert/brand_model.dart';
import 'package:mobile_shopping_platform/service/http_service.dart';

class BrandProvide with ChangeNotifier {
  List<Brands> _brandsList = [];

  get brandsList => _brandsList;
  set brandsList(List<Brands> list) {
    //自己声明一个全部对象
    Brands all = Brands();
    all.brandName = "全部";
    _brandsList = [all];
    _brandsList.addAll(list);
    notifyListeners();
  }
}
