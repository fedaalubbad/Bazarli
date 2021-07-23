
import 'package:bazarli/models/reviews_model/review_classes/product.dart';

class WishList {
  int id;
  Product product;
  String createdAt;
  String updatedAt;

  WishList({this.id, this.product, this.createdAt, this.updatedAt});

  WishList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product =
    json['product'] != null ? new Product.fromJson(json['product']) : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.product != null) {
      data['product'] = this.product.toJson();
    }
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}