// To parse this JSON data, do
//
//     final getCart = getCartFromJson(jsonString);

import 'dart:convert';

import 'cart_Data.dart';

GetCart getCartFromJson(String str) => GetCart.fromJson(json.decode(str));

String getCartToJson(GetCart data) => json.encode(data.toJson());

class GetCart {
  GetCart({
    this.data,
  });

  Data data;

  factory GetCart.fromJson(Map<String, dynamic> json) => GetCart(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}







// class Product {
//   Product({
//     this.id,
//     this.sku,
//     this.type,
//     this.name,
//     this.urlKey,
//     this.price,
//     this.formatedPrice,
//     this.shortDescription,
//     this.description,
//     this.category,
//     this.images,
//     this.videos,
//     this.baseImage,
//     this.createdAt,
//     this.updatedAt,
//     this.reviews,
//     this.inStock,
//     this.isSaved,
//     this.isWishlisted,
//     this.isItemInCart,
//     this.showQuantityChanger,
//     this.specialPrice,
//     this.formatedSpecialPrice,
//     this.regularPrice,
//     this.formatedRegularPrice,
//   });
//
//   int id;
//   String sku;
//   String type;
//   String name;
//   String urlKey;
//   String price;
//   String formatedPrice;
//   String shortDescription;
//   String description;
//   List<Category> category;
//   List<ImageUrl > images;
//   List<dynamic> videos;
//   BaseImage baseImage;
//   DateTime createdAt;
//   DateTime updatedAt;
//   Reviews reviews;
//   bool inStock;
//   bool isSaved;
//   bool isWishlisted;
//   bool isItemInCart;
//   bool showQuantityChanger;
//   String specialPrice;
//   String formatedSpecialPrice;
//   String regularPrice;
//   String formatedRegularPrice;
//
//   factory Product.fromJson(Map<String, dynamic> json) => Product(
//     id: json["id"],
//     sku: json["sku"],
//     type: json["type"],
//     name: json["name"],
//     urlKey: json["url_key"],
//     price: json["price"],
//     formatedPrice: json["formated_price"],
//     shortDescription: json["short_description"],
//     description: json["description"],
//     category: List<Category>.from(json["category"].map((x) => Category.fromJson(x))),
//     images: List<ImageUrl >.from(json["images"].map((x) => ImageUrl .fromJson(x))),
//     videos: List<dynamic>.from(json["videos"].map((x) => x)),
//     baseImage: BaseImage.fromJson(json["base_image"]),
//     createdAt: DateTime.parse(json["created_at"]),
//     updatedAt: DateTime.parse(json["updated_at"]),
//     reviews: Reviews.fromJson(json["reviews"]),
//     inStock: json["in_stock"],
//     isSaved: json["is_saved"],
//     isWishlisted: json["is_wishlisted"],
//     isItemInCart: json["is_item_in_cart"],
//     showQuantityChanger: json["show_quantity_changer"],
//     specialPrice: json["special_price"],
//     formatedSpecialPrice: json["formated_special_price"],
//     regularPrice: json["regular_price"],
//     formatedRegularPrice: json["formated_regular_price"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "sku": sku,
//     "type": type,
//     "name": name,
//     "url_key": urlKey,
//     "price": price,
//     "formated_price": formatedPrice,
//     "short_description": shortDescription,
//     "description": description,
//     "category": List<dynamic>.from(category.map((x) => x.toJson())),
//     "images": List<dynamic>.from(images.map((x) => x.toJson())),
//     "videos": List<dynamic>.from(videos.map((x) => x)),
//     "base_image": baseImage.toJson(),
//     "created_at": createdAt.toIso8601String(),
//     "updated_at": updatedAt.toIso8601String(),
//     "reviews": reviews.toJson(),
//     "in_stock": inStock,
//     "is_saved": isSaved,
//     "is_wishlisted": isWishlisted,
//     "is_item_in_cart": isItemInCart,
//     "show_quantity_changer": showQuantityChanger,
//     "special_price": specialPrice,
//     "formated_special_price": formatedSpecialPrice,
//     "regular_price": regularPrice,
//     "formated_regular_price": formatedRegularPrice,
//   };
// }
//
// class BaseImage {
//   BaseImage({
//     this.smallImageUrl,
//     this.mediumImageUrl,
//     this.largeImageUrl,
//     this.originalImageUrl,
//   });
//
//   String smallImageUrl;
//   String mediumImageUrl;
//   String largeImageUrl;
//   String originalImageUrl;
//
//   factory BaseImage.fromJson(Map<String, dynamic> json) => BaseImage(
//     smallImageUrl: json["small_image_url"],
//     mediumImageUrl: json["medium_image_url"],
//     largeImageUrl: json["large_image_url"],
//     originalImageUrl: json["original_image_url"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "small_image_url": smallImageUrl,
//     "medium_image_url": mediumImageUrl,
//     "large_image_url": largeImageUrl,
//     "original_image_url": originalImageUrl,
//   };
// }
//
// class Category {
//   Category({
//     this.id,
//     this.code,
//     this.name,
//     this.slug,
//     this.displayMode,
//     this.description,
//     this.metaTitle,
//     this.metaDescription,
//     this.metaKeywords,
//     this.status,
//     this.imageUrl,
//     this.additional,
//     this.createdAt,
//     this.updatedAt,
//   });
//
//   int id;
//   dynamic code;
//   String name;
//   String slug;
//   String displayMode;
//   String description;
//   String metaTitle;
//   String metaDescription;
//   String metaKeywords;
//   int status;
//   dynamic imageUrl;
//   dynamic additional;
//   DateTime createdAt;
//   DateTime updatedAt;
//
//   factory Category.fromJson(Map<String, dynamic> json) => Category(
//     id: json["id"],
//     code: json["code"],
//     name: json["name"],
//     slug: json["slug"],
//     displayMode: json["display_mode"],
//     description: json["description"],
//     metaTitle: json["meta_title"],
//     metaDescription: json["meta_description"],
//     metaKeywords: json["meta_keywords"],
//     status: json["status"],
//     imageUrl: json["image_url"],
//     additional: json["additional"],
//     createdAt: DateTime.parse(json["created_at"]),
//     updatedAt: DateTime.parse(json["updated_at"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "code": code,
//     "name": name,
//     "slug": slug,
//     "display_mode": displayMode,
//     "description": description,
//     "meta_title": metaTitle,
//     "meta_description": metaDescription,
//     "meta_keywords": metaKeywords,
//     "status": status,
//     "image_url": imageUrl,
//     "additional": additional,
//     "created_at": createdAt.toIso8601String(),
//     "updated_at": updatedAt.toIso8601String(),
//   };
// }
//
// class ImageUrl {
//   ImageUrl ({
//     this.id,
//     this.path,
//     this.url,
//     this.originalImageUrl,
//     this.smallImageUrl,
//     this.mediumImageUrl,
//     this.largeImageUrl,
//   });
//
//   int id;
//   String path;
//   String url;
//   String originalImageUrl;
//   String smallImageUrl;
//   String mediumImageUrl;
//   String largeImageUrl;
//
//   factory ImageUrl .fromJson(Map<String, dynamic> json) => ImageUrl (
//     id: json["id"],
//     path: json["path"],
//     url: json["url"],
//     originalImageUrl: json["original_image_url"],
//     smallImageUrl: json["small_image_url"],
//     mediumImageUrl: json["medium_image_url"],
//     largeImageUrl: json["large_image_url"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "path": path,
//     "url": url,
//     "original_image_url": originalImageUrl,
//     "small_image_url": smallImageUrl,
//     "medium_image_url": mediumImageUrl,
//     "large_image_url": largeImageUrl,
//   };
// }
//
// class Reviews {
//   Reviews({
//     this.total,
//     this.totalRating,
//     this.averageRating,
//     this.percentage,
//   });
//
//   int total;
//   int totalRating;
//   int averageRating;
//   List<dynamic> percentage;
//
//   factory Reviews.fromJson(Map<String, dynamic> json) => Reviews(
//     total: json["total"],
//     totalRating: json["total_rating"],
//     averageRating: json["average_rating"],
//     percentage: List<dynamic>.from(json["percentage"].map((x) => x)),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "total": total,
//     "total_rating": totalRating,
//     "average_rating": averageRating,
//     "percentage": List<dynamic>.from(percentage.map((x) => x)),
//   };
// }
