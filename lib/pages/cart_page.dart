import 'package:flutter/material.dart';
import 'package:mobile_shopping_platform/components/cartpage/cart_bottom.dart';
import 'package:mobile_shopping_platform/components/cartpage/cart_item.dart';
import 'package:mobile_shopping_platform/convert/cart_model.dart';
import 'package:mobile_shopping_platform/provide/cart_provide.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CartProvide cp = Provider.of<CartProvide>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('购物车'),
      ),
      body: FutureBuilder(
        future: _getCartInfo(context),
        builder: (context, snapshot) {
          if (snapshot != null) {
            List<CartModel> cartList = cp.cartModelList;
            return Stack(
              children: <Widget>[
                ListView.builder(
                  itemCount: cartList.length,
                  itemBuilder: (context, index) {
                    return CartItem(cartList[index]);
                  },
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: CartBottom(),
                ),
              ],
            );
          } else {
            return Center(child: Text('暂无数据'));
          }
        },
      ),
    );
  }

  Future<String> _getCartInfo(BuildContext context) async {
    CartProvide cp = Provider.of<CartProvide>(context);
    await cp.getCartInfo();
    return 'end';
  }
}
