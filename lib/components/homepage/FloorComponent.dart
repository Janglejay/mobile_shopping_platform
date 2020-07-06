//楼层组件
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_shopping_platform/convert/image_imformation_convert.dart';

class FloorTitle extends StatelessWidget {
  final SingleImage singleImage;

  FloorTitle(this.singleImage);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white12,
          border: Border(
            top: BorderSide(width: 1, color: Colors.black12),
          )),
      margin: EdgeInsets.all(10.0),
      child: Image.network(
        singleImage.image_url,
        width: ScreenUtil().setWidth(750),
        height: ScreenUtil().setHeight(100),
      ),
    );
  }
}

//楼层商品列表
class FloorContent extends StatelessWidget {
  final List<SingleImage> floorGoodsList;

  const FloorContent({Key key, this.floorGoodsList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[_firstRow(), _otherGoods()],
      ),
    );
  }

  Widget _firstRow() {
    return Row(
      children: <Widget>[
        _goodsItem(floorGoodsList[0], true),
        Column(
          children: <Widget>[
            _goodsItem(floorGoodsList[1], false),
            _goodsItem(floorGoodsList[2], false),
          ],
        )
      ],
    );
  }

  Widget _otherGoods() {
    return Row(
      children: <Widget>[
        _goodsItem(floorGoodsList[3], false),
        _goodsItem(floorGoodsList[4], false),
      ],
    );
  }

  Widget _goodsItem(SingleImage goods, bool flag) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white12,
          border: Border(
              top: BorderSide(width: 1, color: Colors.black12),
              right: BorderSide(width: 1, color: Colors.black12))),
      width: ScreenUtil().setWidth(375),
      height: flag ? ScreenUtil().setHeight(400) : ScreenUtil().setHeight(200),
      child: InkWell(
        onTap: () {
          print('点击商品');
        },
        child: Image.network(
          goods.image_url,
        ),
      ),
    );
  }
}
