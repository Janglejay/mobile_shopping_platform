import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobile_shopping_platform/components/banner.dart';
import 'package:mobile_shopping_platform/components/recommend.dart';
import 'package:mobile_shopping_platform/components/swiperdiy.dart';
import 'package:mobile_shopping_platform/components/topnavigator.dart';
import 'package:mobile_shopping_platform/config/service_url.dart';
import 'package:mobile_shopping_platform/convert/image_imformation_convert.dart';
import 'package:mobile_shopping_platform/convert/recommend_goods_convert.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: _getHomePage(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var images = ImageList.fromJson(snapshot.data['images']);
          List swiper = images.imageList;
          var icons = ImageList.fromJson(snapshot.data['icons']);
          List topNavigtors = icons.imageList;
          var banner = ImageList.fromJson(snapshot.data['banner']);
          List<SingleImage> bannerImages = banner.imageList;
          var recommendedList =
              RecommendGoodsList.fromJson(snapshot.data['recommendedGoods']);
          List<RecommendGoods> recommendedGoods = recommendedList.recommendList;
          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SwiperDiy(swiperDataList: swiper),
                TopNavigator(
                  navigatorList: topNavigtors,
                ),
                MyBanner(
                  singleImage: bannerImages[0],
                ),
                Recommend(
                  recommendList: recommendedGoods,
                ),
              ],
            ),
          );
        } else {
          return Center(
            child: Text("加载中"),
          );
        }
      },
    ));
  }

  Future _getHomePage() async {
    try {
      Response response;
      Dio dio = new Dio();
      response = await dio.get(getImfomations);
      return response.data;
    } catch (e) {
      return print(e);
    }
  }

  @override
  bool get wantKeepAlive => true;
}
