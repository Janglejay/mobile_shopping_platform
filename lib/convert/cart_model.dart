class CartModel {
  int goodsId;
  String name;
  int count;
  double price;
  String imageUrl;

  CartModel({this.goodsId, this.name, this.count, this.price, this.imageUrl});

  factory CartModel.fromJson(Map<String, dynamic> json) {
    var goodsId = json['goodsId'];
    var name = json['name'];
    var count = json['count'];
    var price = json['price'];
    var imageUrl = json['imageUrl'];
    return CartModel(
        goodsId: goodsId,
        name: name,
        count: count,
        price: price,
        imageUrl: imageUrl);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['goodsId'] = this.goodsId;
    data['name'] = this.name;
    data['count'] = this.count;
    data['price'] = this.price;
    data['imageUrl'] = this.imageUrl;
    return data;
  }
}
