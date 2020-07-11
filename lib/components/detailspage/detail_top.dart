import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_shopping_platform/convert/goodsdetail_model.dart';
import 'package:mobile_shopping_platform/provide/goods_details_provide.dart';
import 'package:provider/provider.dart';

class DetailTop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<GoodsDetailProvide>(
      builder: (context, gdp, child) {
        GoodsDetail goodsInfo = gdp.goodsDetail;
        if (goodsInfo == null) {
          return Text("暂无数据");
        }
        return Container(
          color: Colors.white12,
          child: Column(
            children: <Widget>[
              _goodImage(goodsInfo.imageUrl),
              _goodsName(goodsInfo.name),
              _goodsDescription(goodsInfo.description),
              _goodPrice(goodsInfo)
            ],
          ),
        );
      },
    );
  }

  Widget _goodImage(url) {
    return Image.network(
      url,
      width: ScreenUtil().setWidth(740),
    );
  }

  Widget _goodsName(name) {
    return Container(
      width: ScreenUtil().setWidth(740),
      padding: EdgeInsets.only(left: 15.0),
      child: Text(
        name,
        style: TextStyle(fontSize: ScreenUtil().setSp(30)),
      ),
    );
  }

  Widget _goodsDescription(description) {
    return Container(
      width: ScreenUtil().setWidth(740),
      padding: EdgeInsets.only(left: 15.0),
      child: Text(
        description,
        style:
            TextStyle(fontSize: ScreenUtil().setSp(20), color: Colors.black12),
      ),
    );
  }

  //商品价格
  Widget _goodPrice(GoodsDetail goods) {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      width: ScreenUtil().setWidth(360),
      child: Row(
        children: <Widget>[
          Text(
            "价格：￥${goods.mallPrice}",
            style: TextStyle(
                color: Colors.red[600], fontSize: ScreenUtil().setSp(30)),
          ),
          //删除线样式
          Text(
            "￥${goods.price}",
            style: TextStyle(
                color: Colors.black26, decoration: TextDecoration.lineThrough),
          ),
        ],
      ),
    );
  }
}
