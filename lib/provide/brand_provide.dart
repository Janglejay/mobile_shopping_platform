import 'package:flutter/material.dart';
import 'package:mobile_shopping_platform/config/service_url.dart';
import 'package:mobile_shopping_platform/convert/brand_model.dart';
import 'package:mobile_shopping_platform/service/http_service.dart';

class BrandProvide with ChangeNotifier {
  List<Brands> _brandsList = [];

  get brandsList => _brandsList;
  set brandsList(List list) {
    _brandsList = list;
    notifyListeners();
  }
}
