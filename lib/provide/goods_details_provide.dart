import 'package:flutter/cupertino.dart';
import 'package:mobile_shopping_platform/config/service_url.dart';
import 'package:mobile_shopping_platform/convert/goodsdetail_model.dart';
import 'package:mobile_shopping_platform/service/http_service.dart';

class GoodsDetailProvide with ChangeNotifier {
  GoodsDetail goodsDetail = null;

  //获取数据
  getGoodsDetail(int goodsId) async {
    await getRequest("${GETGOODSDETAIL}/${goodsId}").then((value) {
      // print("value--${value}");
      var goodsDetailModel = GoodsDetailModel.fromJson(value);
      goodsDetail = goodsDetailModel.goods;
      notifyListeners();
    });
  }
}
