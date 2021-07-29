import 'package:bazarli/models/Categories_model/categories_classes/sub_categories.dart';

class Categories {
  int id;
  String slug;
  String name;
  String categoryIconPath;
  String image;
  String code;
  List<Categories> subCategories;

  Categories(
      {this.id,
      this.slug,
      this.name,
      this.categoryIconPath,
      this.image,
      this.code,
      this.subCategories});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    name = json['name']==null? ' ' :json['name'];
    categoryIconPath =
        json['category_icon_path'] == null ? null : json['category_icon_path'];
    image = json['image'];
    code = json['code'];
    if (json['subCategories'] != null) {
      subCategories = new List<Categories>();
      json['subCategories'].forEach((v) {
        subCategories.add(new Categories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['slug'] = this.slug;
    data['name'] = this.name;
    data['category_icon_path'] = this.categoryIconPath;
    data['image'] = this.image;
    data['code'] = this.code;
    if (this.subCategories != null) {
      data['subCategories'] =
          this.subCategories.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
