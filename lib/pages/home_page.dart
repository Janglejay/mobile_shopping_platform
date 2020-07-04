import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:mobile_shopping_platform/config/service_url.dart';
import 'package:mobile_shopping_platform/convert/image_imformation_convert.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: _getHomePage(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var list = ImageList.fromJson(snapshot.data['images']);
          List swiper = list.imageList;
          return Column(
            children: <Widget>[
              SwiperDiy(swiperDataList: swiper),
            ],
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
}

//首页轮播组件
class SwiperDiy extends StatelessWidget {
  final List<SingleImage> swiperDataList;
  SwiperDiy({this.swiperDataList});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 333,
      child: Swiper(
        //轮播图数量
        itemCount: swiperDataList.length,
        //轮播的图片
        itemBuilder: (context, int index) {
          return Image.network("${swiperDataList[index].image_url}");
        },
        //是否有那个可选圆点
        pagination: new SwiperPagination(),
        //自动播放
        autoplay: true,
      ),
    );
  }
}
