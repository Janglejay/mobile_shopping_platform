import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_shopping_platform/convert/goodsdetail_model.dart';
import 'package:mobile_shopping_platform/provide/cart_provide.dart';
import 'package:mobile_shopping_platform/provide/goods_details_provide.dart';
import 'package:mobile_shopping_platform/util/application.dart';
import 'package:provider/provider.dart';

class DetailBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GoodsDetailProvide gdp =
        Provider.of<GoodsDetailProvide>(context, listen: false);

    GoodsDetail goodsDetail = gdp.goodsDetail;
    var goodsId = goodsDetail.goodsId;
    var name = goodsDetail.name;
    var price = goodsDetail.price;
    var imageUrl = goodsDetail.imageUrl;
    var count = 1;

    return Container(
      width: ScreenUtil().setWidth(750),
      color: Colors.white,
      height: ScreenUtil().setHeight(80),
      child: Row(
        children: <Widget>[
          Stack(
            children: <Widget>[
              InkWell(
                onTap: () {
                  Application.router.navigateTo(context, "/cart");
                },
                child: Container(
                  width: ScreenUtil().setWidth(110),
                  height: ScreenUtil().setHeight(80),
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.shopping_cart,
                    size: 35,
                    color: Colors.red[600],
                  ),
                ),
              ),
              //气泡是变化的
              Consumer<CartProvide>(
                builder: (context, cp, child) {
                  int goodsCount = cp.goodsCount;
                  return Positioned(
                    top: 0,
                    right: 10,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(6, 3, 6, 3),
                      decoration: BoxDecoration(
                        color: Colors.red[600],
                        border: Border.all(width: 2, color: Colors.white),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Text(
                        '${cp.goodsCount}',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: ScreenUtil().setSp(22)),
                      ),
                    ),
                  );
                },
              )
            ],
          ),
          InkWell(
            onTap: () async {
              print("dian yong ? ==== ${goodsId}");
              CartProvide cp = Provider.of<CartProvide>(context, listen: false);
              await cp.save(goodsId, name, count, price, imageUrl);
            },
            child: Container(
              width: ScreenUtil().setWidth(320),
              height: ScreenUtil().setHeight(80),
              alignment: Alignment.center,
              color: Colors.greenAccent[400],
              child: Text(
                "加入购入车",
                style: TextStyle(
                    color: Colors.white, fontSize: ScreenUtil().setSp(30)),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Application.router.navigateTo(context, "/cart");
            },
            child: Container(
              width: ScreenUtil().setWidth(320),
              height: ScreenUtil().setHeight(80),
              alignment: Alignment.center,
              color: Colors.red[600],
              child: Text(
                "立即购买",
                style: TextStyle(
                    color: Colors.white, fontSize: ScreenUtil().setSp(30)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
