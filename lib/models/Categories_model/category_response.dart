// To parse this JSON data, do
//
//     final categoriesResponse = categoriesResponseFromJson(jsonString);

import 'dart:convert';

CategoriesResponse categoriesResponseFromJson(String str) => CategoriesResponse.fromJson(json.decode(str));

String categoriesResponseToJson(CategoriesResponse data) => json.encode(data.toJson());

class CategoriesResponse {
  CategoriesResponse({
    this.success,
    this.categories,
  });

  bool success;
  List<Category> categories;

  factory CategoriesResponse.fromJson(Map<String, dynamic> json) => CategoriesResponse(
    success: json["success"],
    categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
  };
}

class Category {
  Category({
    this.id,
    this.categoryId,
    this.title,
    this.description,
    this.image,
    this.imageSize,
    this.position,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.imageUrl,
    this.translations,
  });

  int id;
  int categoryId;
  String title;
  String description;
  String image;
  String imageSize;
  int position;
  int status;
  DateTime createdAt;
  DateTime updatedAt;
  String imageUrl;
  List<Translation> translations;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    categoryId: json["category_id"],
    title: json["title"],
    description: json["description"],
    image: json["image"],
    imageSize: json["image_size"],
    position: json["position"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    imageUrl: json["image_url"]==null?null:json["image_url"],
    translations: List<Translation>.from(json["translations"].map((x) => Translation.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category_id": categoryId,
    "title": title,
    "description": description,
    "image": image,
    "image_size": imageSize,
    "position": position,
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "image_url": imageUrl,
    "translations": List<dynamic>.from(translations.map((x) => x.toJson())),
  };
}

class Translation {
  Translation({
    this.id,
    this.locale,
    this.title,
    this.description,
    this.homeCategoryId,
  });

  int id;
  String locale;
  String title;
  String description;
  int homeCategoryId;

  factory Translation.fromJson(Map<String, dynamic> json) => Translation(
    id: json["id"],
    locale: json["locale"],
    title: json["title"],
    description: json["description"],
    homeCategoryId: json["home_category_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "locale": locale,
    "title": title,
    "description": description,
    "home_category_id": homeCategoryId,
  };
}
