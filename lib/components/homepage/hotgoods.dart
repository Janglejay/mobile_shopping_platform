import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_shopping_platform/convert/image_imformation_convert.dart';

class HotGoods extends StatelessWidget {
  int page;
  List<SingleImage> hotGoodsList;
  HotGoods({this.page, this.hotGoodsList});
//属性定义组件
  Widget hotTitle = Container(
    margin: EdgeInsets.only(top: 15.0),
    padding: EdgeInsets.all(5.0),
    alignment: Alignment.center,
    color: Colors.transparent,
    child: Text("上拉加载"),
  );
  Widget _wrapList() {
    if (hotGoodsList != null) {
      List<Widget> listWidget = hotGoodsList.map((e) {
        return InkWell(
          onTap: () {},
          child: Container(
            width: ScreenUtil().setWidth(372),
            color: Colors.white12,
            padding: EdgeInsets.all(5.0),
            margin: EdgeInsets.only(bottom: 3.0),
            child: Column(
              children: <Widget>[
                Image.network(
                  e.image_url,
                  width: ScreenUtil().setWidth(370),
                ),
                Text(
                  '${e.name}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.deepOrangeAccent,
                      fontSize: ScreenUtil().setSp(26)),
                )
              ],
            ),
          ),
        );
      }).toList();
      return Wrap(
        spacing: 2,
        children: listWidget,
      );
    } else {
      return Text('');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        hotTitle,
        _wrapList(),
      ],
    );
  }
}
