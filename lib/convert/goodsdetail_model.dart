class GoodsDetailModel {
  GoodsDetail goods;

  GoodsDetailModel({this.goods});

  GoodsDetailModel.fromJson(Map<String, dynamic> json) {
    goods =
        json['goods'] != null ? new GoodsDetail.fromJson(json['goods']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.goods != null) {
      data['goods'] = this.goods.toJson();
    }
    return data;
  }
}

class GoodsDetail {
  int goodsId;
  int brandId;
  int categoryId;
  String description;
  String name;
  String imageUrl;
  double mallPrice;
  double price;

  GoodsDetail(
      {this.goodsId,
      this.brandId,
      this.categoryId,
      this.description,
      this.name,
      this.imageUrl,
      this.mallPrice,
      this.price});

  GoodsDetail.fromJson(Map<String, dynamic> json) {
    goodsId = json['goodsId'];
    brandId = json['brandId'];
    categoryId = json['categoryId'];
    description = json['description'];
    name = json['name'];
    imageUrl = json['image_url'];
    mallPrice = json['mallPrice'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['goodsId'] = this.goodsId;
    data['brandId'] = this.brandId;
    data['categoryId'] = this.categoryId;
    data['description'] = this.description;
    data['name'] = this.name;
    data['image_url'] = this.imageUrl;
    data['mallPrice'] = this.mallPrice;
    data['price'] = this.price;
    return data;
  }
}
