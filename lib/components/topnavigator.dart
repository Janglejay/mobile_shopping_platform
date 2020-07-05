import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_shopping_platform/convert/image_imformation_convert.dart';

class TopNavigator extends StatelessWidget {
  final List<SingleImage> navigatorList;
  TopNavigator({Key key, this.navigatorList}) : super(key: key);

  //定义一个内部组件，表示每一个图标+描述
  Widget _gridViewItem(context, item) {
    return InkWell(
      onTap: () {
        print("点击了导航");
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.network(
            "https://${item.image_url}",
            width: ScreenUtil().setWidth(95),
          ),
          Text("${item.name}"),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(355),
      padding: EdgeInsets.only(top: 5.0, left: 5.0, right: 5.0),
      child: GridView.count(
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 5,
          padding: EdgeInsets.only(top: 5.0, left: 5.0, right: 5.0),
          children: navigatorList.map((e) {
            return _gridViewItem(context, e);
          }).toList()),
    );
  }
}
