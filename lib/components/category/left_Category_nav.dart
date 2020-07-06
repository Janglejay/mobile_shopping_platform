import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_shopping_platform/config/service_url.dart';
import 'package:mobile_shopping_platform/convert/category_modal.dart';
import 'package:mobile_shopping_platform/service/http_service.dart';

class LeftCategoryNav extends StatefulWidget {
  LeftCategoryNav({Key key}) : super(key: key);

  @override
  _LeftCategoryNavState createState() => _LeftCategoryNavState();
}

class _LeftCategoryNavState extends State<LeftCategoryNav> {
  List<Categories> list = [];
  @override
  void initState() {
    super.initState();
    _getCateGory();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(180),
      decoration: BoxDecoration(
        border: Border(right: BorderSide(width: 1, color: Colors.black12)),
      ),
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return _leftInkWell(index);
        },
      ),
    );
  }

  Widget _leftInkWell(int index) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: ScreenUtil().setHeight(150),
        padding: EdgeInsets.only(left: 10, top: 20),
        decoration: BoxDecoration(
            color: Colors.white12,
            border:
                Border(bottom: BorderSide(width: 1, color: Colors.black12))),
        child: Text(
          list[index].categoryName,
          style: TextStyle(fontSize: ScreenUtil().setSp(38)),
        ),
      ),
    );
  }

  Future _getCateGory() async {
    await postRequest(GETCATEGORY).then((value) {
      var data = Category.fromJson(value);
      setState(() {
        list = data.categories;
      });
      return data;
    });
  }
}
