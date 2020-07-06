class Brand {
  List<Brands> brands;

  Brand({this.brands});

  Brand.fromJson(Map<String, dynamic> json) {
    if (json['brands'] != null) {
      brands = new List<Brands>();
      json['brands'].forEach((v) {
        brands.add(new Brands.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.brands != null) {
      data['brands'] = this.brands.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Brands {
  int categoryId;
  int brandId;
  String brandName;

  Brands({this.categoryId, this.brandId, this.brandName});

  Brands.fromJson(Map<String, dynamic> json) {
    categoryId = json['categoryId'];
    brandId = json['brandId'];
    brandName = json['brandName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categoryId'] = this.categoryId;
    data['brandId'] = this.brandId;
    data['brandName'] = this.brandName;
    return data;
  }
}
