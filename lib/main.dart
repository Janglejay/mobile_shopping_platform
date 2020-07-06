import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_shopping_platform/pages/index_page.dart';
import 'package:mobile_shopping_platform/provide/brand_provide.dart';
import 'package:mobile_shopping_platform/provide/goods_list_provide.dart';
import 'package:provider/provider.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(width: 750, height: 1334);

    // print("像素密度:${ScreenUtil.pixelRatio}");
    // print("像素密度:${ScreenUtil.screenHeight}");
    // print("像素密度:${ScreenUtil.screenWidth}");

    return Container(
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => BrandProvide()),
          ChangeNotifierProvider(create: (context) => GoodsListProvide()),
        ],
        child: MaterialApp(
          title: "ForU Shop",
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primaryColor: Colors.red[600]),
          home: IndexPage(),
        ),
      ),
    );
  }
}
