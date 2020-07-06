import 'package:flutter/material.dart';
import 'package:mobile_shopping_platform/config/service_url.dart';
import 'package:mobile_shopping_platform/service/http_service.dart';

class LeftCategoryNav extends StatefulWidget {
  @override
  _LeftCategoryNavState createState() => _LeftCategoryNavState();
}

//左侧大类导航
class _LeftCategoryNavState extends State<LeftCategoryNav> {
  List categoryList = [];
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  void _getCategory() async {
    await postRequest(GETCATEGORY).then((value) {});
  }
}
