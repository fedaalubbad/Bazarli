// To parse this JSON data, do
//
//     final wishlistResponse = wishlistResponseFromJson(jsonString);

import 'dart:convert';

WishlistResponse wishlistResponseFromJson(String str) => WishlistResponse.fromJson(json.decode(str));

String wishlistResponseToJson(WishlistResponse data) => json.encode(data.toJson());

class WishlistResponse {
  WishlistResponse({
    this.data,
    this.links,
    this.meta,
  });

  List<Datum> data;
  Links links;
  Meta meta;

  factory WishlistResponse.fromJson(Map<String, dynamic> json) => WishlistResponse(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    links: Links.fromJson(json["links"]),
    meta: Meta.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "links": links.toJson(),
    "meta": meta.toJson(),
  };
}

class Datum {
  Datum({
    this.id,
    this.product,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  Product product;
  DateTime createdAt;
  DateTime updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    product: Product.fromJson(json["product"]),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product": product.toJson(),
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class Product {
  Product({
    this.id,
    this.sku,
    this.type,
    this.name,
    this.urlKey,
    this.price,
    this.specialPrice,
    this.savingPrice,
    this.shortDescription,
    this.description,
    this.category,
    this.images,
    this.baseImage,
    this.brand,
    this.color,
    this.createdAt,
    this.updatedAt,
    this.reviews,
    this.inStock,
    this.isSaved,
    this.isWishlisted,
    this.isItemInCart,
    this.showQuantityChanger,
    this.variants,
  });

  int id;
  String sku;
  String type;
  String name;
  String urlKey;
  String price;
  String specialPrice;
  String savingPrice;
  String shortDescription;
  String description;
  List<Category> category;
  List<Image> images;
  BaseImage baseImage;
  Brand brand;
  Brand color;
  DateTime createdAt;
  DateTime updatedAt;
  Reviews reviews;
  bool inStock;
  bool isSaved;
  bool isWishlisted;
  bool isItemInCart;
  bool showQuantityChanger;
  List<Variant> variants;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    sku: json["sku"],
    type: json["type"],
    name: json["name"],
    urlKey: json["url_key"],
    price: json["price"],
    specialPrice: json["special_price"],
    savingPrice: json["saving_price"],
    shortDescription: json["short_description"],
    description: json["description"],
    category: List<Category>.from(json["category"].map((x) => Category.fromJson(x))),
    images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
    baseImage: BaseImage.fromJson(json["base_image"]),
    brand: Brand.fromJson(json["brand"]),
    color: Brand.fromJson(json["color"]),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    reviews: Reviews.fromJson(json["reviews"]),
    inStock: json["in_stock"],
    isSaved: json["is_saved"],
    isWishlisted: json["is_wishlisted"],
    isItemInCart: json["is_item_in_cart"],
    showQuantityChanger: json["show_quantity_changer"],
    variants: List<Variant>.from(json["variants"].map((x) => Variant.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "sku": sku,
    "type": type,
    "name": name,
    "url_key": urlKey,
    "price": price,
    "special_price": specialPrice,
    "saving_price": savingPrice,
    "short_description": shortDescription,
    "description": description,
    "category": List<dynamic>.from(category.map((x) => x.toJson())),
    "images": List<dynamic>.from(images.map((x) => x.toJson())),
    "base_image": baseImage.toJson(),
    "brand": brand.toJson(),
    "color": color.toJson(),
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "reviews": reviews.toJson(),
    "in_stock": inStock,
    "is_saved": isSaved,
    "is_wishlisted": isWishlisted,
    "is_item_in_cart": isItemInCart,
    "show_quantity_changer": showQuantityChanger,
    "variants": List<dynamic>.from(variants.map((x) => x.toJson())),
  };
}

class BaseImage {
  BaseImage({
    this.smallImageUrl,
    this.mediumImageUrl,
    this.largeImageUrl,
    this.originalImageUrl,
  });

  String smallImageUrl;
  String mediumImageUrl;
  String largeImageUrl;
  String originalImageUrl;

  factory BaseImage.fromJson(Map<String, dynamic> json) => BaseImage(
    smallImageUrl: json["small_image_url"],
    mediumImageUrl: json["medium_image_url"],
    largeImageUrl: json["large_image_url"],
    originalImageUrl: json["original_image_url"],
  );

  Map<String, dynamic> toJson() => {
    "small_image_url": smallImageUrl,
    "medium_image_url": mediumImageUrl,
    "large_image_url": largeImageUrl,
    "original_image_url": originalImageUrl,
  };
}

class Brand {
  Brand({
    this.id,
    this.label,
    this.swatchValue,
  });

  int id;
  String label;
  String swatchValue;

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
    id: json["id"] == null ? null : json["id"],
    label: json["label"] == null ? null : json["label"],
    swatchValue: json["swatch_value"] == null ? null : json["swatch_value"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "label": label == null ? null : label,
    "swatch_value": swatchValue == null ? null : swatchValue,
  };
}

class Category {
  Category({
    this.id,
    this.code,
    this.name,
    this.slug,
    this.displayMode,
    this.description,
    this.metaTitle,
    this.metaDescription,
    this.metaKeywords,
    this.status,
    this.imageUrl,
    this.additional,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  dynamic code;
  String name;
  String slug;
  String displayMode;
  String description;
  String metaTitle;
  dynamic metaDescription;
  String metaKeywords;
  int status;
  String imageUrl;
  dynamic additional;
  DateTime createdAt;
  DateTime updatedAt;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    code: json["code"],
    name: json["name"],
    slug: json["slug"],
    displayMode: json["display_mode"],
    description: json["description"],
    metaTitle: json["meta_title"],
    metaDescription: json["meta_description"],
    metaKeywords: json["meta_keywords"],
    status: json["status"],
    imageUrl: json["image_url"],
    additional: json["additional"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "code": code,
    "name": name,
    "slug": slug,
    "display_mode": displayMode,
    "description": description,
    "meta_title": metaTitle,
    "meta_description": metaDescription,
    "meta_keywords": metaKeywords,
    "status": status,
    "image_url": imageUrl,
    "additional": additional,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class Image {
  Image({
    this.id,
    this.path,
    this.url,
    this.originalImageUrl,
    this.smallImageUrl,
    this.mediumImageUrl,
    this.largeImageUrl,
  });

  int id;
  String path;
  String url;
  String originalImageUrl;
  String smallImageUrl;
  String mediumImageUrl;
  String largeImageUrl;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    id: json["id"],
    path: json["path"],
    url: json["url"],
    originalImageUrl: json["original_image_url"],
    smallImageUrl: json["small_image_url"],
    mediumImageUrl: json["medium_image_url"],
    largeImageUrl: json["large_image_url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "path": path,
    "url": url,
    "original_image_url": originalImageUrl,
    "small_image_url": smallImageUrl,
    "medium_image_url": mediumImageUrl,
    "large_image_url": largeImageUrl,
  };
}

class Reviews {
  Reviews({
    this.total,
    this.totalRating,
    this.averageRating,
    this.percentage,
  });

  int total;
  int totalRating;
  int averageRating;
  List<dynamic> percentage;

  factory Reviews.fromJson(Map<String, dynamic> json) => Reviews(
    total: json["total"],
    totalRating: json["total_rating"],
    averageRating: json["average_rating"],
    percentage: List<dynamic>.from(json["percentage"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "total_rating": totalRating,
    "average_rating": averageRating,
    "percentage": List<dynamic>.from(percentage.map((x) => x)),
  };
}

class Variant {
  Variant({
    this.id,
    this.sku,
    this.type,
    this.name,
    this.urlKey,
    this.parentId,
    this.price,
    this.specialPrice,
    this.savingPrice,
    this.shortDescription,
    this.description,
    this.size,
    this.createdAt,
    this.updatedAt,
    this.quantity,
  });

  int id;
  String sku;
  String type;
  String name;
  String urlKey;
  int parentId;
  String price;
  String specialPrice;
  String savingPrice;
  String shortDescription;
  String description;
  Size size;
  DateTime createdAt;
  DateTime updatedAt;
  int quantity;

  factory Variant.fromJson(Map<String, dynamic> json) => Variant(
    id: json["id"],
    sku: json["sku"],
    type: json["type"],
    name: json["name"],
    urlKey: json["url_key"],
    parentId: json["parent_id"],
    price: json["price"],
    specialPrice: json["special_price"],
    savingPrice: json["saving_price"],
    shortDescription: json["short_description"],
    description: json["description"],
    size: Size.fromJson(json["size"]),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    quantity: json["quantity"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "sku": sku,
    "type": type,
    "name": name,
    "url_key": urlKey,
    "parent_id": parentId,
    "price": price,
    "special_price": specialPrice,
    "saving_price": savingPrice,
    "short_description": shortDescription,
    "description": description,
    "size": size.toJson(),
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "quantity": quantity,
  };
}

class Size {
  Size({
    this.id,
    this.label,
  });

  int id;
  String label;

  factory Size.fromJson(Map<String, dynamic> json) => Size(
    id: json["id"],
    label: json["label"] == null ? null : json["label"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "label": label == null ? null : label,
  };
}

class Links {
  Links({
    this.first,
    this.last,
    this.prev,
    this.next,
  });

  String first;
  String last;
  dynamic prev;
  dynamic next;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    first: json["first"],
    last: json["last"],
    prev: json["prev"],
    next: json["next"],
  );

  Map<String, dynamic> toJson() => {
    "first": first,
    "last": last,
    "prev": prev,
    "next": next,
  };
}

class Meta {
  Meta({
    this.currentPage,
    this.from,
    this.lastPage,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  int currentPage;
  int from;
  int lastPage;
  String path;
  int perPage;
  int to;
  int total;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    currentPage: json["current_page"],
    from: json["from"],
    lastPage: json["last_page"],
    path: json["path"],
    perPage: json["per_page"],
    to: json["to"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "from": from,
    "last_page": lastPage,
    "path": path,
    "per_page": perPage,
    "to": to,
    "total": total,
  };
}
