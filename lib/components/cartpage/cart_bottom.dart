import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.0),
      color: Colors.white12,
      child: Row(
        children: <Widget>[_selectAll(), _allPrice(), _goButton()],
      ),
    );
  }

  //全选按钮
  Widget _selectAll() {
    return Container(
      child: Row(
        children: <Widget>[
          Checkbox(
            value: true,
            activeColor: Colors.red[600],
            onChanged: (value) {},
          ),
          Text("全选")
        ],
      ),
    );
  }

  //合计区域
  Widget _allPrice() {
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
                  '￥1992',
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
  Widget _goButton() {
    return Container(
      width: ScreenUtil().setWidth(160),
      padding: EdgeInsets.only(left: 10),
      child: InkWell(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.all(10.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.red[600],
            borderRadius: BorderRadius.circular(3.0),
          ),
          child: Text(
            "结算(6)",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
