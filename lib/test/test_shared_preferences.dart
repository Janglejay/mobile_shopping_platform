import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<String> testList = [];
  @override
  Widget build(BuildContext context) {
    _show();
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            height: ScreenUtil().setHeight(500),
            child: ListView.builder(
              itemCount: testList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("${testList[index]}"),
                );
              },
            ),
          ),
          RaisedButton(
            onPressed: () {
              _add();
            },
            child: Text("添加"),
          ),
          RaisedButton(
            onPressed: () {
              _delete();
            },
            child: Text("删除"),
          ),
        ],
      ),
    );
  }

  //增加方法
  void _add() async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    String temp = "data  ----- -- - -- - -- ";
    testList.add(temp);
    preference.setStringList("mydata", testList);
    _show();
  }

  //查询方法
  void _show() async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    if (preference.getStringList("mydata") != null) {
      setState(() {
        testList = preference.getStringList("mydata");
      });
    }
  }

  //删除方法
  void _delete() async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    //1.将所有的key value都删除了
    // preference.clear();
    preference.remove("mydata");
    setState(() {
      testList = [];
    });
  }
}
