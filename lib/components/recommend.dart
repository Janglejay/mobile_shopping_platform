import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_shopping_platform/convert/recommend_goods_convert.dart';

class Recommend extends StatelessWidget {
  final List<RecommendGoods> recommendList;
  Recommend({this.recommendList});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(380),
      margin: EdgeInsets.only(top: 10),
      child: Column(
        children: <Widget>[
          _titleWidget(),
          _recommendList(),
        ],
      ),
    );
  }

  //标题方法
  Widget _titleWidget() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.fromLTRB(10.0, 2.0, 0, 5.0),
      decoration: BoxDecoration(
          color: Colors.white12,
          border: Border(bottom: BorderSide(width: 1, color: Colors.black12))),
      child: Text('商品推荐',
          style: TextStyle(
            color: Colors.red[400],
          )),
    );
  }

  //商品单独项方法
  Widget _item(index) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: ScreenUtil().setHeight(330),
        width: ScreenUtil().setWidth(250),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            color: Colors.white12,
            border: Border(left: BorderSide(width: 1, color: Colors.black12))),
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
              child: Image.network(recommendList[index].image_url),
              flex: 3,
            ),
            Expanded(
              child: Text('￥${recommendList[index].mallPrice}'),
              flex: 1,
            ),
            Expanded(
              child: Text(
                '￥${recommendList[index].price}',
                style: TextStyle(
                    decoration: TextDecoration.lineThrough, color: Colors.grey),
              ),
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }

  //横向列表方法
  Widget _recommendList() {
    return Container(
        height: ScreenUtil().setHeight(320),
        //设置成横向
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: recommendList.length,
          itemBuilder: (context, index) => _item(index),
        ));
  }
}
