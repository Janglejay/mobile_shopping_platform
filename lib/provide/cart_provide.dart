import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:mobile_shopping_platform/convert/cart_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartProvide with ChangeNotifier {
  String cartString = "[]";
  List<CartModel> cartModelList = [];
  save(goodsId, name, count, price, imageUrl) async {
    SharedPreferences pre = await SharedPreferences.getInstance();
    //先把原来的取出来
    cartString = pre.getString("cartInfo");
    //有值就让他变成flutter的对象
    var temp = cartString == null ? [] : json.decode(cartString.toString());
    List<Map> tempList = (temp as List).cast();
    bool isHave = false;
    int index = 0;
    tempList.forEach((e) {
      if (e['goodsId'] == goodsId) {
        tempList[index]['count'] = e['count'] + 1;
        cartModelList[index].count++;
        isHave = true;
      }
      index++;
    });
    if (!isHave) {
      Map<String, dynamic> addGoods = {
        'goodsId': goodsId,
        'name': name,
        'count': count,
        'price': price,
        'imageUrl': imageUrl
      };
      tempList.add(addGoods);
      cartModelList.add(CartModel.fromJson(addGoods));
    }
    //将结果转成json
    cartString = json.encode(tempList).toString();
    // print("打印字符串" + cartString);
    // print("数据模型 ${cartModelList}");
    pre.setString("cartInfo", cartString);
    notifyListeners();
  }

  removeCart() async {
    SharedPreferences pre = await SharedPreferences.getInstance();
    pre.remove("cartInfo");
    //一定要记得清空
    cartModelList = [];
    // print("清空完成");
    notifyListeners();
  }

  getCartInfo() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    cartString = preferences.getString("cartInfo");
    cartModelList = [];
    if (cartString == null) {
      cartModelList = [];
    } else {
      List<Map> tempList = (json.decode(cartString.toString()) as List).cast();
      tempList.forEach((e) {
        cartModelList.add(CartModel.fromJson(e));
      });
    }
    notifyListeners();
  }
}
