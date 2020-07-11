import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_shopping_platform/components/cartpage/cart_count.dart';
import 'package:mobile_shopping_platform/convert/cart_model.dart';
import 'package:mobile_shopping_platform/provide/cart_provide.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  final CartModel item;
  CartItem(this.item);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(5.0, 2.0, 5.0, 2.0),
      padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 1, color: Colors.black12))),
      child: Consumer<CartProvide>(
        builder: (context, value, child) {
          return Row(
            children: <Widget>[
              _cartCheckItem(context),
              _goodsImage(),
              _goodsName(),
              _goodsPrice()
            ],
          );
        },
      ),
    );
  }

  //复选按钮
  Widget _cartCheckItem(BuildContext context) {
    return Container(
      child: Checkbox(
        value: item.isCheck,
        activeColor: Colors.red[600],
        onChanged: (bool val) {
          item.isCheck = val;
          CartProvide cp = Provider.of<CartProvide>(context, listen: false);
          cp.changeCheckState(item);
        },
      ),
    );
  }

  //商品图片
  Widget _goodsImage() {
    return Container(
      width: ScreenUtil().setWidth(150),
      padding: EdgeInsets.all(3.0),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.black12),
      ),
      child: Image.network(item.imageUrl),
    );
  }

  //商品名称
  Widget _goodsName() {
    return Container(
      width: ScreenUtil().setWidth(300),
      padding: EdgeInsets.all(10),
      alignment: Alignment.topLeft,
      child: Column(
        children: <Widget>[Text(item.name), CartCount(item)],
      ),
    );
  }

  //商品价格
  Widget _goodsPrice() {
    return Container(
      width: ScreenUtil().setWidth(150),
      alignment: Alignment.centerRight,
      // margin: EdgeInsets.only(bottom: 15.0),
      // padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Container(
            child: Text('￥${item.price}'),
            margin: EdgeInsets.only(bottom: 15.0),
          ),
          Consumer<CartProvide>(
            builder: (context, cp, child) {
              return Container(
                child: InkWell(
                  onTap: () {
                    cp.deleteOneGoods(item.goodsId);
                  },
                  child: Icon(
                    Icons.delete_forever,
                    color: Colors.red[600],
                    size: 30,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
