import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_shopping_platform/config/service_url.dart';
import 'package:mobile_shopping_platform/convert/goods_model.dart';
import 'package:mobile_shopping_platform/service/http_service.dart';

class GoodsList extends StatefulWidget {
  @override
  _GoodsListState createState() => _GoodsListState();
}

class _GoodsListState extends State<GoodsList> {
  List<Goods> goodsList = [];

  @override
  void initState() {
    super.initState();
    _getGoodsList(1, 1, 1);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(570),
      height: ScreenUtil().setHeight(960),
      child: ListView.builder(
        itemCount: goodsList.length,
        itemBuilder: (context, index) {
          return _myListItem(index);
        },
      ),
    );
  }

  //组合成一个子项
  Widget _myListItem(int index) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
        decoration: BoxDecoration(
            color: Colors.white12,
            border:
                Border(bottom: BorderSide(color: Colors.black12, width: 1))),
        child: Row(
          children: <Widget>[
            _goodsImage(index),
            Column(
              children: <Widget>[_goodsName(index), _goodPrice(index)],
            )
          ],
        ),
      ),
    );
  }

  _getGoodsList(int categoryId, int brandId, int page) async {
    var params = {"categoryId": categoryId, "brandId": brandId, "page": page};
    await postRequest(GETBANDGOODS, data: params).then((value) {
      var goodModel = GoodsListModel.fromJson(value);
      var list = goodModel.goods;
      setState(() {
        goodsList = list;
      });
    });
  }

//图片区域
  Widget _goodsImage(index) {
    return Container(
      width: ScreenUtil().setWidth(200),
      child: Image.network(goodsList[index].imageUrl),
    );
  }

  //商品名称
  Widget _goodsName(index) {
    return Container(
      width: ScreenUtil().setWidth(360),
      padding: EdgeInsets.all(5),
      child: Text(
        goodsList[index].name,
        maxLines: 2,
        overflow: TextOverflow.ellipsis, //省略号
        style: TextStyle(fontSize: ScreenUtil().setSp(28)),
      ),
    );
  }

  //商品价格
  Widget _goodPrice(index) {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      width: ScreenUtil().setWidth(360),
      child: Row(
        children: <Widget>[
          Text(
            "价格：￥${goodsList[index].mallPrice}",
            style: TextStyle(
                color: Colors.red[600], fontSize: ScreenUtil().setSp(30)),
          ),
          //删除线样式
          Text(
            "￥${goodsList[index].price}",
            style: TextStyle(
                color: Colors.black26, decoration: TextDecoration.lineThrough),
          ),
        ],
      ),
    );
  }
}
