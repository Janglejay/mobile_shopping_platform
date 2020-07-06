//首页轮播组件
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:mobile_shopping_platform/convert/image_imformation_convert.dart';

class SwiperDiy extends StatelessWidget {
  final List<SingleImage> swiperDataList;
  SwiperDiy({this.swiperDataList});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(400),
      width: ScreenUtil().setWidth(750),
      child: Swiper(
        //轮播图数量
        itemCount: swiperDataList.length,
        //轮播的图片
        itemBuilder: (context, int index) {
          return Image.network(
            "${swiperDataList[index].image_url}",
            fit: BoxFit.fill,
          );
        },
        //是否有那个可选圆点
        pagination: new SwiperPagination(),
        //自动播放
        autoplay: true,
      ),
    );
  }
}
