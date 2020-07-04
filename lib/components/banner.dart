import 'package:flutter/material.dart';
import 'package:mobile_shopping_platform/convert/image_imformation_convert.dart';
import 'package:url_launcher/url_launcher.dart' as lau;

class MyBanner extends StatelessWidget {
  final SingleImage singleImage;
  MyBanner({this.singleImage});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _launcherURL,
      child: Container(
        child: Image.network(
          singleImage.image_url,
          // height: 50,
          width: 1000,
        ),
      ),
    );
  }

  void _launcherURL() async {
    String url =
        "https://bigsale.tmall.com/wow/a/act/haiwaifenzu/dailygroup/1331/wupr?spm=a21wu.241046-cn.3982445802.d2.41cab6cb74GBoq&wh_pid=daily-195765";
    if (await lau.canLaunch(url)) {
      await lau.launch(url);
    } else {
      throw new Exception("url 异常");
    }
  }
}
