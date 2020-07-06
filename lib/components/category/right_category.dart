import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RightCategory extends StatefulWidget {
  RightCategory({Key key}) : super(key: key);

  @override
  _RightCategoryState createState() => _RightCategoryState();
}

class _RightCategoryState extends State<RightCategory> {
  List list = [
    '1ssss',
    '2ssss',
    '3ssss',
    '4ssss',
    '5ssss',
    '6ssss',
    '7ssss',
    '8sssss'
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(100),
      width: ScreenUtil().setWidth(570),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(width: 1, color: Colors.black12))),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        itemBuilder: (context, index) {
          return _rightInkWell(list[index]);
        },
      ),
    );
  }

  Widget _rightInkWell(String item) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 10.0),
        child: Text(
          item,
          style: TextStyle(fontSize: ScreenUtil().setSp(28)),
        ),
      ),
    );
  }
}
