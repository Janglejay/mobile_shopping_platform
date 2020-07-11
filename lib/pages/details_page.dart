import 'package:flutter/material.dart';
import 'package:mobile_shopping_platform/components/detailspage/detail_top.dart';
import 'package:mobile_shopping_platform/components/detailspage/details_bottom.dart';
import 'package:mobile_shopping_platform/provide/goods_details_provide.dart';
import 'package:provider/provider.dart';

class DetailsPage extends StatelessWidget {
  final int goodsId;
  DetailsPage(this.goodsId);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("商品详细页"),
      ),
      body: FutureBuilder(
          future: _getGoodsDetail(context),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Stack(
                children: <Widget>[
                  Container(
                    child: ListView(
                      children: <Widget>[DetailTop(), DetailBottom()],
                    ),
                  ),
                  //定位组件
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Text('测试'),
                  ),
                ],
              );
            } else {
              return Text("暂无信息");
            }
          }),
    );
  }

  Future _getGoodsDetail(BuildContext context) async {
    GoodsDetailProvide gdp =
        Provider.of<GoodsDetailProvide>(context, listen: false);
    await gdp.getGoodsDetail(goodsId);
    return "完成加载";
  }
}
