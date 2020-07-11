class CartModel {
  int goodsId;
  String name;
  int count;
  double price;
  String imageUrl;
  bool isCheck;

  CartModel(
      {this.goodsId,
      this.name,
      this.count,
      this.price,
      this.imageUrl,
      this.isCheck});

  factory CartModel.fromJson(Map<String, dynamic> json) {
    var goodsId = json['goodsId'];
    var name = json['name'];
    var count = json['count'];
    var price = json['price'];
    var imageUrl = json['imageUrl'];
    var isCheck = json['isCheck'];
    return CartModel(
      goodsId: goodsId,
      name: name,
      count: count,
      price: price,
      imageUrl: imageUrl,
      isCheck: isCheck,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['goodsId'] = this.goodsId;
    data['name'] = this.name;
    data['count'] = this.count;
    data['price'] = this.price;
    data['imageUrl'] = this.imageUrl;
    data['isCheck'] = this.isCheck;
    return data;
  }
}
