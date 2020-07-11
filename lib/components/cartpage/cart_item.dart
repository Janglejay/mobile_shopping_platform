import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_shopping_platform/convert/cart_model.dart';

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
      child: Row(
        children: <Widget>[
          _cartCheckItem(),
          _goodsImage(),
          _goodsName(),
          _goodsPrice()
        ],
      ),
    );
  }

  //复选按钮
  Widget _cartCheckItem() {
    return Container(
      child: Checkbox(
        value: true,
        activeColor: Colors.red[600],
        onChanged: (bool val) {},
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
        children: <Widget>[
          Text(item.name),
        ],
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
          Container(
            child: InkWell(
              onTap: () {},
              child: Icon(
                Icons.delete_forever,
                color: Colors.red[600],
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
