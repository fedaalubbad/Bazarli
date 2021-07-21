import 'package:bazarli/models/product_model/product_classes/base_images.dart';
import 'package:bazarli/models/product_model/product_classes/reviews.dart';

import 'category.dart';

class Product {
  int id;
  String sku;
  String type;
  String name;
  String urlKey;
  String price;
  String formatedPrice;
  String shortDescription;
  String description;
  List<Category> category;
  List<Null> images;
  List<Null> videos;
  BaseImage baseImage;
  String createdAt;
  String updatedAt;
  Reviews reviews;
  bool inStock;
  bool isSaved;
  bool isWishlisted;
  bool isItemInCart;
  bool showQuantityChanger;

  Product(
      {this.id,
        this.sku,
        this.type,
        this.name,
        this.urlKey,
        this.price,
        this.formatedPrice,
        this.shortDescription,
        this.description,
        this.category,
        this.images,
        this.videos,
        this.baseImage,
        this.createdAt,
        this.updatedAt,
        this.reviews,
        this.inStock,
        this.isSaved,
        this.isWishlisted,
        this.isItemInCart,
        this.showQuantityChanger});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sku = json['sku'];
    type = json['type'];
    name = json['name'];
    urlKey = json['url_key'];
    price = json['price'];
    formatedPrice = json['formated_price'];
    shortDescription = json['short_description'];
    description = json['description'];
    if (json['category'] != null) {
      category = new List<Category>();
      json['category'].forEach((v) {
        category.add(new Category.fromJson(v));
      });
    }
    // if (json['images'] != null) {
    //   images = new List<Null>();
    //   json['images'].forEach((v) {
    //     images.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['videos'] != null) {
    //   videos = new List<Null>();
    //   json['videos'].forEach((v) {
    //     videos.add(new Null.fromJson(v));
    //   });
    // }
    baseImage = json['base_image'] != null
        ? new BaseImage.fromJson(json['base_image'])
        : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    reviews =
    json['reviews'] != null ? new Reviews.fromJson(json['reviews']) : null;
    inStock = json['in_stock'];
    isSaved = json['is_saved'];
    isWishlisted = json['is_wishlisted'];
    isItemInCart = json['is_item_in_cart'];
    showQuantityChanger = json['show_quantity_changer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sku'] = this.sku;
    data['type'] = this.type;
    data['name'] = this.name;
    data['url_key'] = this.urlKey;
    data['price'] = this.price;
    data['formated_price'] = this.formatedPrice;
    data['short_description'] = this.shortDescription;
    data['description'] = this.description;
    if (this.category != null) {
      data['category'] = this.category.map((v) => v.toJson()).toList();
    }
    // if (this.images != null) {
    //   data['images'] = this.images.map((v) => v.toJson()).toList();
    // }
    // if (this.videos != null) {
    //   data['videos'] = this.videos.map((v) => v.toJson()).toList();
    // }
    if (this.baseImage != null) {
      data['base_image'] = this.baseImage.toJson();
    }
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.reviews != null) {
      data['reviews'] = this.reviews.toJson();
    }
    data['in_stock'] = this.inStock;
    data['is_saved'] = this.isSaved;
    data['is_wishlisted'] = this.isWishlisted;
    data['is_item_in_cart'] = this.isItemInCart;
    data['show_quantity_changer'] = this.showQuantityChanger;
    return data;
  }
}
