import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_shopping_platform/config/service_url.dart';
import 'package:mobile_shopping_platform/convert/brand_model.dart';
import 'package:mobile_shopping_platform/convert/goods_model.dart';
import 'package:mobile_shopping_platform/provide/brand_provide.dart';
import 'package:mobile_shopping_platform/provide/goods_list_provide.dart';
import 'package:mobile_shopping_platform/service/http_service.dart';
import 'package:provider/provider.dart';

class RightCategory extends StatefulWidget {
  RightCategory({Key key}) : super(key: key);

  @override
  _RightCategoryState createState() => _RightCategoryState();
}

class _RightCategoryState extends State<RightCategory> {
  @override
  Widget build(BuildContext context) {
    BrandProvide bp = Provider.of<BrandProvide>(context);
    List<Brands> brandsList = bp.brandsList;
    return Container(
      height: ScreenUtil().setHeight(100),
      width: ScreenUtil().setWidth(570),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(width: 1, color: Colors.black12))),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: brandsList.length,
        itemBuilder: (context, index) {
          return _rightInkWell(brandsList[index], index);
        },
      ),
    );
  }

  Widget _rightInkWell(Brands item, int clickIndex) {
    BrandProvide bp = Provider.of<BrandProvide>(context);
    bool isClick = clickIndex == bp.clickIndex;
    return InkWell(
      onTap: () {
        //重复点击自己没有效果
        if (clickIndex == bp.clickIndex) {
          return;
        }
        _click(clickIndex);
        if (clickIndex != 0) {
          _getGoodsList(item.categoryId, item.brandId, bp.page);
        } else {
          _getAllGoods(item.categoryId);
        }
      },
      child: Container(
        alignment: Alignment(0, 0),
        padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 10.0),
        child: Text(
          item.brandName,
          style: TextStyle(
              fontSize: ScreenUtil().setSp(28),
              color: isClick ? Colors.red[600] : null),
        ),
      ),
    );
  }

  // 通过点击品牌获得的
  _getGoodsList(int categoryId, int brandId, int page) async {
    var params = {"categoryId": categoryId, "brandId": brandId, "page": page};
    await postRequest(GETBANDGOODS, data: params).then((value) {
      var goodModel = GoodsListModel.fromJson(value);
      var list = goodModel.goods;
      GoodsListProvide gp =
          Provider.of<GoodsListProvide>(context, listen: false);
      BrandProvide bp = Provider.of<BrandProvide>(context, listen: false);
      gp.goodsList = list;
      bp.page++;
    });
  }

  _getAllGoods(int categoryId) async {
    var params = {"categoryId": categoryId};
    await postRequest(GETALLGOODS, data: params).then((value) {
      var goodModel = GoodsListModel.fromJson(value);
      var list = goodModel.goods;
      GoodsListProvide gp =
          Provider.of<GoodsListProvide>(context, listen: false);
      gp.goodsList = list;
    });
  }

  _click(int clickIndex) {
    BrandProvide bp = Provider.of<BrandProvide>(context, listen: false);
    bp.clickIndex = clickIndex;
  }
}
