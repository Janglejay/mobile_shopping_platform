import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_shopping_platform/provide/cart_provide.dart';
import 'package:provider/provider.dart';

class CartBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.0),
      color: Colors.white12,
      child: Consumer<CartProvide>(
        builder: (context, value, child) {
          return Row(
            children: <Widget>[
              _selectAll(context),
              _allPrice(context),
              _goButton(context)
            ],
          );
        },
      ),
    );
  }

  //全选按钮
  Widget _selectAll(_) {
    CartProvide cp = Provider.of<CartProvide>(_, listen: false);
    bool isAllCheck = cp.isAllCheck;
    List list = cp.cartModelList;
    return Container(
      child: Row(
        children: <Widget>[
          Checkbox(
            value: isAllCheck,
            activeColor: Colors.red[600],
            onChanged: (value) {
              if (list.length == 0) {
                return;
              }
              CartProvide cp = Provider.of<CartProvide>(_, listen: false);
              cp.changeAllCheck(value);
            },
          ),
          Text("全选")
        ],
      ),
    );
  }

  //合计区域
  Widget _allPrice(context) {
    CartProvide cp = Provider.of<CartProvide>(context);
    double priceSum = cp.priceSum;
    return Container(
      width: ScreenUtil().setWidth(430),
      // alignment: Alignment,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                alignment: Alignment.centerRight,
                width: ScreenUtil().setWidth(280),
                child: Text(
                  "合计:",
                  style: TextStyle(fontSize: ScreenUtil().setSp(30)),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                width: ScreenUtil().setWidth(150),
                child: Text(
                  '￥${priceSum}',
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(28), color: Colors.red[600]),
                ),
              )
            ],
          ),
          Container(
            width: ScreenUtil().setWidth(430),
            alignment: Alignment.centerRight,
            child: Text(
              "满十元免配送费，预购免配送费",
              style: TextStyle(
                  color: Colors.black26, fontSize: ScreenUtil().setSp(28)),
            ),
          )
        ],
      ),
    );
  }

  //结算按钮
  Widget _goButton(context) {
    CartProvide cp = Provider.of<CartProvide>(context, listen: false);
    int count = cp.goodsCount;
    return Container(
      width: ScreenUtil().setWidth(160),
      padding: EdgeInsets.only(left: 10),
      child: InkWell(
        onTap: () {
          CartProvide cp = Provider.of<CartProvide>(context, listen: false);
          cp.removeCart();
        },
        child: Container(
          padding: EdgeInsets.all(10.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.red[600],
            borderRadius: BorderRadius.circular(3.0),
          ),
          child: Text(
            "结算(${count})",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
