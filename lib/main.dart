import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_shopping_platform/pages/index_page.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(width: 750, height: 1334);

    // print("像素密度:${ScreenUtil.pixelRatio}");
    // print("像素密度:${ScreenUtil.screenHeight}");
    // print("像素密度:${ScreenUtil.screenWidth}");

    return Container(
      child: MaterialApp(
        title: "ForU Shop",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.red[600]),
        home: IndexPage(),
      ),
    );
  }
}
