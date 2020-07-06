import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_shopping_platform/convert/brand_model.dart';
import 'package:mobile_shopping_platform/provide/brand_provide.dart';
import 'package:provider/provider.dart';

class RightCategory extends StatefulWidget {
  RightCategory({Key key}) : super(key: key);

  @override
  _RightCategoryState createState() => _RightCategoryState();
}

class _RightCategoryState extends State<RightCategory> {
  @override
  Widget build(BuildContext context) {
    BrandProvide bp = Provider.of<BrandProvide>(context);
    List<Brands> brandsList = bp.brandsList;
    return Container(
      height: ScreenUtil().setHeight(100),
      width: ScreenUtil().setWidth(570),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(width: 1, color: Colors.black12))),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: brandsList.length,
        itemBuilder: (context, index) {
          return _rightInkWell(brandsList[index]);
        },
      ),
    );
  }

  Widget _rightInkWell(Brands item) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 10.0),
        child: Text(
          item.brandName,
          style: TextStyle(fontSize: ScreenUtil().setSp(28)),
        ),
      ),
    );
  }
}
