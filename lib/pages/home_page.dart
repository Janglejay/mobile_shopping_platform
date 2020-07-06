import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:mobile_shopping_platform/components/homepage/FloorComponent.dart';
import 'package:mobile_shopping_platform/components/homepage/banner.dart';
import 'package:mobile_shopping_platform/components/homepage/hotgoods.dart';
import 'package:mobile_shopping_platform/components/homepage/recommend.dart';
import 'package:mobile_shopping_platform/components/homepage/swiperdiy.dart';
import 'package:mobile_shopping_platform/components/homepage/topnavigator.dart';
import 'package:mobile_shopping_platform/config/service_url.dart';
import 'package:mobile_shopping_platform/convert/image_imformation_convert.dart';
import 'package:mobile_shopping_platform/convert/recommend_goods_convert.dart';
import 'package:mobile_shopping_platform/service/http_service.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  int page = 1;
  List<SingleImage> hotGoodsList = [];

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // leading: Icon(Icons.adjust),
          title: Text(' ForU Shop'),
        ),
        backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
        body: FutureBuilder(
          future: getRequest(GETINFORMATHION),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var images = ImageList.fromJson(snapshot.data['images']);
              List swiper = images.imageList;
              var icons = ImageList.fromJson(snapshot.data['icons']);
              List topNavigtors = icons.imageList;
              var banner = ImageList.fromJson(snapshot.data['banner']);
              List<SingleImage> bannerImages = banner.imageList;
              var recommendedList = RecommendGoodsList.fromJson(
                  snapshot.data['recommendedGoods']);
              List<RecommendGoods> recommendedGoods =
                  recommendedList.recommendList;
              var floorTitle1 = SingleImage.fromJson(snapshot.data['ft1']);
              var floorTitle2 = SingleImage.fromJson(snapshot.data['ft2']);
              var fg1 = ImageList.fromJson(snapshot.data['fc1']);
              var fg2 = ImageList.fromJson(snapshot.data['fc2']);
              List<SingleImage> floorGoodsList1 = fg1.imageList;
              List<SingleImage> floorGoodsList2 = fg2.imageList;
              return EasyRefresh(
                child: ListView(
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
                    FloorTitle(floorTitle1),
                    FloorContent(
                      floorGoodsList: floorGoodsList1,
                    ),
                    FloorTitle(floorTitle2),
                    FloorContent(
                      floorGoodsList: floorGoodsList2,
                    ),
                    HotGoods(
                      page: this.page,
                      hotGoodsList: this.hotGoodsList,
                    ),
                  ],
                ),
                onLoad: () async {
                  var data = {"page": page};
                  await getRequest(GETHOTGOODS, args: data).then((value) {
                    var data = value['hotgoods'];
                    ImageList imageList = ImageList.fromJson(data);
                    List<SingleImage> newHotGoodsList = imageList.imageList;
                    setState(() {
                      hotGoodsList.addAll(newHotGoodsList);
                      page++;
                    });
                  });
                },
              );
            } else {
              return Center(
                child: Text("加载中"),
              );
            }
          },
        ));
  }

  @override
  bool get wantKeepAlive => true;
}
