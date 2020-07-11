import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_shopping_platform/pages/index_page.dart';
import 'package:mobile_shopping_platform/provide/brand_provide.dart';
import 'package:mobile_shopping_platform/provide/goods_details_provide.dart';
import 'package:mobile_shopping_platform/provide/goods_list_provide.dart';
import 'package:mobile_shopping_platform/util/application.dart';
import 'package:mobile_shopping_platform/util/routes.dart';
import 'package:provider/provider.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //注册路由
    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;

    ScreenUtil.init(width: 750, height: 1334);

    // print("像素密度:${ScreenUtil.pixelRatio}");
    // print("像素密度:${ScreenUtil.screenHeight}");
    // print("像素密度:${ScreenUtil.screenWidth}");

    return Container(
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => BrandProvide()),
          ChangeNotifierProvider(create: (context) => GoodsListProvide()),
          ChangeNotifierProvider(create: (context) => GoodsDetailProvide())
        ],
        child: MaterialApp(
          //注册路由
          onGenerateRoute: Application.router.generator,
          routes: {},
          title: "ForU Shop",
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primaryColor: Colors.red[600]),
          home: IndexPage(),
        ),
      ),
    );
  }
}
