// To parse this JSON data, do
//
//     final categoriesWithBrandsResponse = categoriesWithBrandsResponseFromJson(jsonString);

import 'dart:convert';

CategoriesWithBrandsResponse categoriesWithBrandsResponseFromJson(String str) => CategoriesWithBrandsResponse.fromJson(json.decode(str));

String categoriesWithBrandsResponseToJson(CategoriesWithBrandsResponse data) => json.encode(data.toJson());

class CategoriesWithBrandsResponse {
  CategoriesWithBrandsResponse({
    this.status,
    this.categories,
  });

  bool status;
  List<Category> categories;

  factory CategoriesWithBrandsResponse.fromJson(Map<String, dynamic> json) => CategoriesWithBrandsResponse(
    status: json["status"],
    categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
  };
}

class Category {
  Category({
    this.id,
    this.originalName,
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
    this.brandIds,
    this.brands,
    this.productsCount,
    this.name,
    this.description,
    this.slug,
    this.urlPath,
    this.metaTitle,
    this.metaDescription,
    this.metaKeywords,
    this.translations,
    this.children,
  });

  int id;
  String originalName;
  int position;
  String image;
  int status;
  int lft;
  int rgt;
  int parentId;
  DateTime createdAt;
  DateTime updatedAt;
  DisplayMode displayMode;
  dynamic categoryIconPath;
  dynamic additional;
  int isDisplayOnHome;
  dynamic homeCategoryContent;
  dynamic homeCategoryImage;
  int homeCategoryPosition;
  String brandIds;
  List<Brand> brands;
  int productsCount;
  String name;
  String description;
  String slug;
  String urlPath;
  String metaTitle;
  dynamic metaDescription;
  String metaKeywords;
  List<CategoryTranslation> translations;
  List<Category> children;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    originalName: json["original_name"],
    position: json["position"],
    image: json["image"],
    status: json["status"],
    lft: json["_lft"],
    rgt: json["_rgt"],
    parentId: json["parent_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    displayMode: displayModeValues.map[json["display_mode"]],
    categoryIconPath: json["category_icon_path"],
    additional: json["additional"],
    isDisplayOnHome: json["is_display_on_home"],
    homeCategoryContent: json["home_category_content"],
    homeCategoryImage: json["home_category_image"],
    homeCategoryPosition: json["home_category_position"],
    brandIds: json["brand_ids"] == null ? null : json["brand_ids"],
    brands: json["brands"] == null ? null : List<Brand>.from(json["brands"].map((x) => Brand.fromJson(x))),
    productsCount: json["products_count"] == null ? null : json["products_count"],
    name: json["name"],
    description: json["description"],
    slug: json["slug"],
    urlPath: json["url_path"],
    metaTitle: json["meta_title"],
    metaDescription: json["meta_description"],
    metaKeywords: json["meta_keywords"],
    translations: List<CategoryTranslation>.from(json["translations"].map((x) => CategoryTranslation.fromJson(x))),
    children: List<Category>.from(json["children"].map((x) => Category.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "original_name": originalName,
    "position": position,
    "image": image,
    "status": status,
    "_lft": lft,
    "_rgt": rgt,
    "parent_id": parentId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "display_mode": displayModeValues.reverse[displayMode],
    "category_icon_path": categoryIconPath,
    "additional": additional,
    "is_display_on_home": isDisplayOnHome,
    "home_category_content": homeCategoryContent,
    "home_category_image": homeCategoryImage,
    "home_category_position": homeCategoryPosition,
    "brand_ids": brandIds == null ? null : brandIds,
    "brands": brands == null ? null : List<dynamic>.from(brands.map((x) => x.toJson())),
    "products_count": productsCount == null ? null : productsCount,
    "name": name,
    "description": description,
    "slug": slug,
    "url_path": urlPath,
    "meta_title": metaTitle,
    "meta_description": metaDescription,
    "meta_keywords": metaKeywords,
    "translations": List<dynamic>.from(translations.map((x) => x.toJson())),
    "children": List<dynamic>.from(children.map((x) => x.toJson())),
  };
}

class Brand {
  Brand({
    this.id,
    this.adminName,
    this.sortOrder,
    this.attributeId,
    this.swatchValue,
    this.label,
    this.translations,
  });

  int id;
  String adminName;
  int sortOrder;
  int attributeId;
  String swatchValue;
  Label label;
  List<BrandTranslation> translations;

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
    id: json["id"],
    adminName: json["admin_name"],
    sortOrder: json["sort_order"],
    attributeId: json["attribute_id"],
    swatchValue: json["swatch_value"],
    label: labelValues.map[json["label"]],
    translations: List<BrandTranslation>.from(json["translations"].map((x) => BrandTranslation.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "admin_name": adminName,
    "sort_order": sortOrder,
    "attribute_id": attributeId,
    "swatch_value": swatchValue ,
    "label": labelValues.reverse[label],
    "translations": List<dynamic>.from(translations.map((x) => x.toJson())),
  };
}

enum Label { ADIDAS, EMPTY }

final labelValues = EnumValues({
  "adidas": Label.ADIDAS,
  "": Label.EMPTY
});


class BrandTranslation {
  BrandTranslation({
    this.id,
    this.locale,
    this.label,
    this.attributeOptionId,
  });

  int id;
  Locale locale;
  Label label;
  int attributeOptionId;

  factory BrandTranslation.fromJson(Map<String, dynamic> json) => BrandTranslation(
    id: json["id"],
    locale: localeValues.map[json["locale"]],
    label: labelValues.map[json["label"]],
    attributeOptionId: json["attribute_option_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "locale": localeValues.reverse[locale],
    "label": labelValues.reverse[label],
    "attribute_option_id": attributeOptionId,
  };
}

enum Locale { AR, EN, FR, NL, TR }

final localeValues = EnumValues({
  "ar": Locale.AR,
  "en": Locale.EN,
  "fr": Locale.FR,
  "nl": Locale.NL,
  "tr": Locale.TR
});

enum DisplayMode { PRODUCTS_AND_DESCRIPTION }

final displayModeValues = EnumValues({
  "products_and_description": DisplayMode.PRODUCTS_AND_DESCRIPTION
});
//
// enum Image { CATEGORY_1_SUM_OKFG_OZ9_JD4_ORT_R_ZZ_VCV0_J_BN0_Y_F_TZM_IX6_Q_HUX2_JPG }
//
// final imageValues = EnumValues({
//   "category/1/sumOkfgOz9Jd4ortRZzVcv0JBn0yFTzmIx6qHux2.jpg": Image.CATEGORY_1_SUM_OKFG_OZ9_JD4_ORT_R_ZZ_VCV0_J_BN0_Y_F_TZM_IX6_Q_HUX2_JPG
// });

class CategoryTranslation {
  CategoryTranslation({
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
  dynamic metaDescription;
  String metaKeywords;
  int categoryId;
  Locale locale;
  int localeId;
  String urlPath;

  factory CategoryTranslation.fromJson(Map<String, dynamic> json) => CategoryTranslation(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
    description: json["description"],
    metaTitle: json["meta_title"],
    metaDescription: json["meta_description"],
    metaKeywords: json["meta_keywords"],
    categoryId: json["category_id"],
    locale: localeValues.map[json["locale"]],
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
    "locale": localeValues.reverse[locale],
    "locale_id": localeId,
    "url_path": urlPath,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
