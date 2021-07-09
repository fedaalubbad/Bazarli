import 'categories_classes/category.dart';

class CategoriesResponse {
  bool status;
  List<Categories> categories;

  CategoriesResponse({this.status, this.categories});

  CategoriesResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['categories'] != null) {
      categories = new List<Categories>();
      json['categories'].forEach((v) {
        categories.add(new Categories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.categories != null) {
      data['categories'] = this.categories.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
