import 'brand_classes/brand.dart';

class BrandResponse {
  List<Brands> brands;

  BrandResponse({this.brands});

  BrandResponse.fromJson(Map<String, dynamic> json) {
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
