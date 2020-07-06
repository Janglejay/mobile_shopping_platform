import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_shopping_platform/config/service_url.dart';
import 'package:mobile_shopping_platform/convert/brand_model.dart';
import 'package:mobile_shopping_platform/convert/category_model.dart';
import 'package:mobile_shopping_platform/convert/goods_model.dart';
import 'package:mobile_shopping_platform/provide/brand_provide.dart';
import 'package:mobile_shopping_platform/provide/goods_list_provide.dart';
import 'package:mobile_shopping_platform/service/http_service.dart';
import 'package:provider/provider.dart';

class LeftCategoryNav extends StatefulWidget {
  LeftCategoryNav({Key key}) : super(key: key);

  @override
  _LeftCategoryNavState createState() => _LeftCategoryNavState();
}

class _LeftCategoryNavState extends State<LeftCategoryNav> {
  List<Categories> list = [];
  //选中的索引
  int clickIndex = 0;
  @override
  void initState() {
    super.initState();
    _getCateGory();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(180),
      decoration: BoxDecoration(
        border: Border(right: BorderSide(width: 1, color: Colors.black12)),
      ),
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return _leftInkWell(index);
        },
      ),
    );
  }

  Widget _leftInkWell(int index) {
    bool isClick = false;
    isClick = index == clickIndex ? true : false;
    return InkWell(
      onTap: () {
        setState(() {
          clickIndex = index;
        });
        _getBrandsList(list[index].categoryId);
        _getGoodsList(list[index].categoryId);
      },
      child: Container(
        height: ScreenUtil().setHeight(150),
        padding: EdgeInsets.only(left: 10, top: 20),
        decoration: BoxDecoration(
            color: isClick ? Colors.black12 : Colors.white12,
            border:
                Border(bottom: BorderSide(width: 1, color: Colors.black12))),
        child: Text(
          list[index].categoryName,
          style: TextStyle(fontSize: ScreenUtil().setSp(38)),
        ),
      ),
    );
  }

  Future _getCateGory() async {
    await postRequest(GETCATEGORY).then((value) {
      var data = Category.fromJson(value);
      setState(() {
        list = data.categories;
      });
      //第一次进入的时候将默认的第一分类的品牌显示出来
      _getBrandsList(data.categories[0].categoryId);
      _getGoodsList(data.categories[0].categoryId);
      return data;
    });
  }

  Future _getBrandsList(int id) async {
    Map params = {"categoryId": id};
    await postRequest(GETBRANDS, data: params).then((value) {
      var data = Brand.fromJson(value);
      //listen:false 当前组件不会重绘
      BrandProvide bp = Provider.of<BrandProvide>(context, listen: false);
      bp.brandsList = data.brands;
      return data.brands;
    });
  }

//一个分类下的所有物品
  _getGoodsList(int categoryId) async {
    var params = {"categoryId": categoryId};
    await postRequest(GETALLGOODS, data: params).then((value) {
      var goodModel = GoodsListModel.fromJson(value);
      var list = goodModel.goods;
      GoodsListProvide gp =
          Provider.of<GoodsListProvide>(context, listen: false);
      gp.goodsList = list;
    });
  }

//通过点击品牌获得的
  // _getGoodsList(int categoryId, int brandId, int page) async {
  //   var params = {"categoryId": categoryId, "brandId": brandId, "page": page};
  //   await postRequest(GETBANDGOODS, data: params).then((value) {
  //     var goodModel = GoodsListModel.fromJson(value);
  //     var list = goodModel.goods;
  //     GoodsListProvide gp = Provider.of<GoodsListProvide>(context);
  //     gp.goodsList = list;
  //   });
  // }
}
