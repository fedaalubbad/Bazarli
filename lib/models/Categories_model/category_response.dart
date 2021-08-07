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
    this.position,
    this.image,
    this.status,
    this.lft,
    this.rgt,
    this.parentId,
    this.createdAt,
    this.updatedAt,
    this.displayMode,
    this.categoryIconPath,
    this.additional,
    this.isDisplayOnHome,
    this.homeCategoryContent,
    this.homeCategoryImage,
    this.homeCategoryPosition,
    this.name,
    this.description,
    this.slug,
    this.urlPath,
    this.metaTitle,
    this.metaDescription,
    this.metaKeywords,
    this.translations,
  });

  int id;
  int position;
  dynamic image;
  int status;
  int lft;
  int rgt;
  int parentId;
  DateTime createdAt;
  DateTime updatedAt;
  String displayMode;
  dynamic categoryIconPath;
  dynamic additional;
  int isDisplayOnHome;
  String homeCategoryContent;
  String homeCategoryImage;
  int homeCategoryPosition;
  String name;
  String description;
  String slug;
  String urlPath;
  String metaTitle;
  String metaDescription;
  String metaKeywords;
  List<Translation> translations;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    position: json["position"],
    image: json["image"],
    status: json["status"],
    lft: json["_lft"],
    rgt: json["_rgt"],
    parentId: json["parent_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    displayMode: json["display_mode"],
    categoryIconPath: json["category_icon_path"],
    additional: json["additional"],
    isDisplayOnHome: json["is_display_on_home"],
    homeCategoryContent: json["home_category_content"],
    homeCategoryImage: json["home_category_image"],
    homeCategoryPosition: json["home_category_position"],
    name: json["name"],
    description: json["description"],
    slug: json["slug"],
    urlPath: json["url_path"],
    metaTitle: json["meta_title"],
    metaDescription: json["meta_description"],
    metaKeywords: json["meta_keywords"],
    translations: List<Translation>.from(json["translations"].map((x) => Translation.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "position": position,
    "image": image,
    "status": status,
    "_lft": lft,
    "_rgt": rgt,
    "parent_id": parentId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "display_mode": displayMode,
    "category_icon_path": categoryIconPath,
    "additional": additional,
    "is_display_on_home": isDisplayOnHome,
    "home_category_content": homeCategoryContent,
    "home_category_image": homeCategoryImage,
    "home_category_position": homeCategoryPosition,
    "name": name,
    "description": description,
    "slug": slug,
    "url_path": urlPath,
    "meta_title": metaTitle,
    "meta_description": metaDescription,
    "meta_keywords": metaKeywords,
    "translations": List<dynamic>.from(translations.map((x) => x.toJson())),
  };
}

class Translation {
  Translation({
    this.id,
    this.name,
    this.slug,
    this.description,
    this.metaTitle,
    this.metaDescription,
    this.metaKeywords,
    this.categoryId,
    this.locale,
    this.localeId,
    this.urlPath,
  });

  int id;
  String name;
  String slug;
  String description;
  String metaTitle;
  String metaDescription;
  String metaKeywords;
  int categoryId;
  String locale;
  int localeId;
  String urlPath;

  factory Translation.fromJson(Map<String, dynamic> json) => Translation(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
    description: json["description"],
    metaTitle: json["meta_title"],
    metaDescription: json["meta_description"],
    metaKeywords: json["meta_keywords"],
    categoryId: json["category_id"],
    locale: json["locale"],
    localeId: json["locale_id"],
    urlPath: json["url_path"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "slug": slug,
    "description": description,
    "meta_title": metaTitle,
    "meta_description": metaDescription,
    "meta_keywords": metaKeywords,
    "category_id": categoryId,
    "locale": locale,
    "locale_id": localeId,
    "url_path": urlPath,
  };
}
