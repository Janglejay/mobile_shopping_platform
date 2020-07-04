class RecommendGoodsList {
  List<RecommendGoods> recommendList;
  RecommendGoodsList({this.recommendList});
  factory RecommendGoodsList.fromJson(List<dynamic> json) {
    List<RecommendGoods> recommandList =
        json.map((e) => RecommendGoods.fromJson(e)).toList();
    return RecommendGoodsList(recommendList: recommandList);
  }
}

class RecommendGoods {
  String name;
  String image_url;
  double mallPrice;
  double price;
  RecommendGoods({this.name, this.image_url, this.mallPrice, this.price});
  factory RecommendGoods.fromJson(Map<String, dynamic> json) {
    return RecommendGoods(
        name: json['name'],
        image_url: json['image_url'],
        mallPrice: json['mallPrice'],
        price: json['price']);
  }
}
