import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_shopping_platform/convert/goods_model.dart';
import 'package:mobile_shopping_platform/provide/goods_list_provide.dart';
import 'package:provider/provider.dart';

class GoodsList extends StatefulWidget {
  @override
  _GoodsListState createState() => _GoodsListState();
}

class _GoodsListState extends State<GoodsList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<GoodsListProvide>(builder: (context, gp, child) {
      //利用Expanded高度溢出bug
      return Expanded(
        child: Container(
          width: ScreenUtil().setWidth(570),
          // height: ScreenUtil().setHeight(1000),
          child: ListView.builder(
              itemCount: gp.goodsList.length,
              itemBuilder: (context, index) {
                return _myListItem(index, gp.goodsList);
              }),
        ),
      );
    });
  }

  //组合成一个子项
  Widget _myListItem(int index, List<Goods> gl) {
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
            _goodsImage(index, gl),
            Column(
              children: <Widget>[_goodsName(index, gl), _goodPrice(index, gl)],
            )
          ],
        ),
      ),
    );
  }

//图片区域
  Widget _goodsImage(index, List<Goods> gl) {
    return Container(
      width: ScreenUtil().setWidth(200),
      child: Image.network(gl[index].imageUrl),
    );
  }

  //商品名称
  Widget _goodsName(index, List<Goods> gl) {
    return Container(
      width: ScreenUtil().setWidth(360),
      padding: EdgeInsets.all(5),
      child: Text(
        gl[index].name,
        maxLines: 2,
        overflow: TextOverflow.ellipsis, //省略号
        style: TextStyle(fontSize: ScreenUtil().setSp(28)),
      ),
    );
  }

  //商品价格
  Widget _goodPrice(index, List<Goods> gl) {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      width: ScreenUtil().setWidth(360),
      child: Row(
        children: <Widget>[
          Text(
            "价格：￥${gl[index].mallPrice}",
            style: TextStyle(
                color: Colors.red[600], fontSize: ScreenUtil().setSp(30)),
          ),
          //删除线样式
          Text(
            "￥${gl[index].price}",
            style: TextStyle(
                color: Colors.black26, decoration: TextDecoration.lineThrough),
          ),
        ],
      ),
    );
  }
}
