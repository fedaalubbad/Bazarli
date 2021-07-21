
import 'package:bazarli/models/reviews_model/review_classes/product.dart';

class ReviewData {
  int id;
  String title;
  String rating;
  String comment;
  String name;
  String status;
  Product product;
  String createdAt;
  String updatedAt;

  ReviewData(
      {this.id,
        this.title,
        this.rating,
        this.comment,
        this.name,
        this.status,
        this.product,
        this.createdAt,
        this.updatedAt});

  ReviewData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    rating = json['rating'];
    comment = json['comment'];
    name = json['name'];
    status = json['status'];
    product =
    json['product'] != null ? new Product.fromJson(json['product']) : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['rating'] = this.rating;
    data['comment'] = this.comment;
    data['name'] = this.name;
    data['status'] = this.status;
    if (this.product != null) {
      data['product'] = this.product.toJson();
    }
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}