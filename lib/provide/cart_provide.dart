import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:mobile_shopping_platform/convert/cart_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartProvide with ChangeNotifier {
  String cartString = "[]";
  List<CartModel> cartModelList = [];
  double priceSum = 0.0;
  int goodsCount = 0;
  bool isAllCheck = true;
  save(goodsId, name, count, price, imageUrl) async {
    SharedPreferences pre = await SharedPreferences.getInstance();
    //先把原来的取出来
    cartString = pre.getString("cartInfo");
    //有值就让他变成flutter的对象
    var temp = (null == cartString) ? [] : json.decode(cartString.toString());
    // print("==========${temp}");
    List<Map> tempList = (temp as List).cast();
    // print("tempList =  == == = == = = ${tempList}");
    bool isHave = false;
    int index = 0;
    // print("tempList length ${tempList.length}");

    tempList.forEach((e) {
      if (e['goodsId'] == goodsId) {
        tempList[index]['count'] = e['count'] + 1;
        print("cartModelList length====${cartModelList.length}");
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
        'imageUrl': imageUrl,
        'isCheck': true
      };
      tempList.add(addGoods);
      cartModelList.add(CartModel.fromJson(addGoods));
    }
    //将结果转成json
    cartString = json.encode(tempList).toString();
    // print("打印字符串" + cartString);
    // print("数据模型 ${cartModelList}");
    pre.setString("cartInfo", cartString);
    getCartInfo();
  }

  removeCart() async {
    SharedPreferences pre = await SharedPreferences.getInstance();
    pre.remove("cartInfo");
    //一定要记得清空
    // print("清空字符串${cartString}");
    // print("清空模型层 ${cartModelList}");
    cartString = "[]";
    cartModelList = [];
    // print("清空完成");
    notifyListeners();
  }

  getCartInfo() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    cartString = preferences.getString("cartInfo");
    // print("getcartINfo  ====${cartString}");
    cartModelList = [];
    if (null == cartModelList) {
      cartModelList = [];
    } else {
      List<Map> tempList = (json.decode(cartString.toString()) as List).cast();
      priceSum = 0.0;
      goodsCount = 0;
      isAllCheck = true;
      tempList.forEach((e) {
        if (e['isCheck']) {
          priceSum += (e['count'] * e['price']);
          goodsCount += e['count'];
        } else {
          isAllCheck = false;
        }
        cartModelList.add(CartModel.fromJson(e));
      });
    }
    // print("get cart info ${cartModelList}");
    notifyListeners();
  }

  //删除单个购物车商品
  deleteOneGoods(int goodsId) async {
    SharedPreferences pre = await SharedPreferences.getInstance();
    cartString = pre.getString('cartInfo');
    List<Map> tempList = (json.decode(cartString.toString()) as List).cast();

    int tempIndex = 0;
    int delIndex;
    tempList.forEach((e) {
      if (e['goodsId'] == goodsId) {
        delIndex = tempIndex;
      }
      tempIndex++;
    });
    tempList.removeAt(delIndex);
    cartString = json.encode(tempList).toString();
    pre.setString("cartInfo", cartString);
    print("=======tempList=====${tempList}");
    //删除之后调用获取商品的方法
    //那边已经通知了
    await getCartInfo();
  }

  //
  changeCheckState(CartModel cartModel) async {
    SharedPreferences pre = await SharedPreferences.getInstance();
    cartString = pre.getString("cartInfo");
    List<Map> tempList = (json.decode(cartString.toString()) as List).cast();
    int tempIndex = 0;
    int changeIndex = 0;
    tempList.forEach((e) {
      if (e['goodsId'] == cartModel.goodsId) {
        changeIndex = tempIndex;
      }
      tempIndex++;
    });
    tempList[changeIndex] = cartModel.toJson();
    cartString = json.encode(tempList).toString();
    pre.setString("cartInfo", cartString);
    await getCartInfo();
  }

  //点击全选按钮操作
  changeAllCheck(bool isCheck) async {
    SharedPreferences pre = await SharedPreferences.getInstance();
    cartString = pre.getString("cartInfo");
    List<Map> tempList = (json.decode(cartString.toString()) as List).cast();
    List<Map> newList = [];
    for (var item in tempList) {
      var newItem = item;
      newItem['isCheck'] = isCheck;
      newList.add(newItem);
    }
    cartString = json.encode(newList).toString();
    pre.setString("cartInfo", cartString);
    await getCartInfo();
  }

  //商品相加减
  addOrReduceAction(CartModel cartItem, String todo) async {
    SharedPreferences pre = await SharedPreferences.getInstance();
    cartString = pre.getString("cartInfo");
    List<Map> tempList = (json.decode(cartString.toString()) as List).cast();
    int tempIndex = 0;
    int changeIndex = 0;
    tempList.forEach((e) {
      if (e['goodsId'] == cartItem.goodsId) {
        changeIndex = tempIndex;
      }
      tempIndex++;
    });
    if ("add" == todo) {
      cartItem.count++;
    } else if (cartItem.count > 1) {
      cartItem.count--;
    }
    tempList[changeIndex] = cartItem.toJson();
    cartString = json.encode(tempList).toString();
    pre.setString("cartInfo", cartString);
    await getCartInfo();
  }
}
