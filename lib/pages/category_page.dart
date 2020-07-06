import 'package:flutter/material.dart';
import 'package:mobile_shopping_platform/components/category/left_Category_nav.dart';
import 'package:mobile_shopping_platform/components/category/right_category.dart';

class CateGoryPage extends StatefulWidget {
  @override
  _CateGoryPageState createState() => _CateGoryPageState();
}

class _CateGoryPageState extends State<CateGoryPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('商品分类'),
      ),
      body: Container(
        child: Row(
          children: <Widget>[
            LeftCategoryNav(),
            Column(
              children: <Widget>[
                RightCategory(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
