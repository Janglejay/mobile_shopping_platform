import 'package:flutter/material.dart';
import 'package:mobile_shopping_platform/pages/cart_page.dart';
import 'package:mobile_shopping_platform/pages/category_page.dart';
import 'package:mobile_shopping_platform/pages/home_page.dart';
import 'package:mobile_shopping_platform/pages/member_page.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("首页")),
    BottomNavigationBarItem(icon: Icon(Icons.search), title: Text("分类")),
    BottomNavigationBarItem(
        icon: Icon(Icons.shopping_cart), title: Text("购物车")),
    BottomNavigationBarItem(icon: Icon(Icons.person_pin), title: Text("会员中心"))
  ];
  final List<Widget> tabBodies = [
    HomePage(),
    CateGoryPage(),
    CartPage(),
    MemberPage()
  ];
  int curIndex = 0;
  Widget curBody;
  @override
  void initState() {
    super.initState();
    curBody = tabBodies[curIndex];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: Icon(Icons.adjust),
        title: Text(' ForU Shop'),
      ),
      backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: bottomTabs,
        currentIndex: curIndex,
        onTap: (index) {
          setState(() {
            curIndex = index;
            curBody = tabBodies[curIndex];
          });
        },
      ),
      body: IndexedStack(
        index: curIndex,
        children: tabBodies,
      ),
    );
  }
}
