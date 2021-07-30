// To parse this JSON data, do
//
//     final addToCart = addToCartFromJson(jsonString);

import 'dart:convert';

AddToCart addToCartFromJson(String str) => AddToCart.fromJson(json.decode(str));

String addToCartToJson(AddToCart data) => json.encode(data.toJson());

class AddToCart {
  AddToCart({
    this.message,
    this.data,
  });

  String message;
  Data data;

  factory AddToCart.fromJson(Map<String, dynamic> json) => AddToCart(
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    this.id,
    this.customerEmail,
    this.customerFirstName,
    this.customerLastName,
    this.shippingMethod,
    this.couponCode,
    this.isGift,
    this.itemsCount,
    this.itemsQty,
    this.exchangeRate,
    this.globalCurrencyCode,
    this.baseCurrencyCode,
    this.channelCurrencyCode,
    this.cartCurrencyCode,
    this.grandTotal,
    this.formatedGrandTotal,
    this.baseGrandTotal,
    this.formatedBaseGrandTotal,
    this.subTotal,
    this.formatedSubTotal,
    this.baseSubTotal,
    this.formatedBaseSubTotal,
    this.taxTotal,
    this.formatedTaxTotal,
    this.baseTaxTotal,
    this.formatedBaseTaxTotal,
    this.discount,
    this.formatedDiscount,
    this.baseDiscount,
    this.formatedBaseDiscount,
    this.checkoutMethod,
    this.isGuest,
    this.isActive,
    this.conversionTime,
    this.channel,
    this.items,
    this.selectedShippingRate,
    this.payment,
    this.billingAddress,
    this.shippingAddress,
    this.createdAt,
    this.updatedAt,
    this.taxes,
    this.formatedTaxes,
    this.baseTaxes,
    this.formatedBaseTaxes,
    this.formatedDiscountedSubTotal,
    this.formatedBaseDiscountedSubTotal,
  });

  int id;
  dynamic customerEmail;
  dynamic customerFirstName;
  dynamic customerLastName;
  dynamic shippingMethod;
  dynamic couponCode;
  int isGift;
  int itemsCount;
  String itemsQty;
  dynamic exchangeRate;
  String globalCurrencyCode;
  String baseCurrencyCode;
  String channelCurrencyCode;
  String cartCurrencyCode;
  String grandTotal;
  String formatedGrandTotal;
  String baseGrandTotal;
  String formatedBaseGrandTotal;
  String subTotal;
  String formatedSubTotal;
  String baseSubTotal;
  String formatedBaseSubTotal;
  String taxTotal;
  String formatedTaxTotal;
  String baseTaxTotal;
  String formatedBaseTaxTotal;
  String discount;
  String formatedDiscount;
  String baseDiscount;
  String formatedBaseDiscount;
  dynamic checkoutMethod;
  int isGuest;
  int isActive;
  dynamic conversionTime;
  dynamic channel;
  List<Item> items;
  dynamic selectedShippingRate;
  dynamic payment;
  dynamic billingAddress;
  dynamic shippingAddress;
  DateTime createdAt;
  DateTime updatedAt;
  String taxes;
  String formatedTaxes;
  String baseTaxes;
  String formatedBaseTaxes;
  String formatedDiscountedSubTotal;
  String formatedBaseDiscountedSubTotal;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    customerEmail: json["customer_email"],
    customerFirstName: json["customer_first_name"],
    customerLastName: json["customer_last_name"],
    shippingMethod: json["shipping_method"],
    couponCode: json["coupon_code"],
    isGift: json["is_gift"],
    itemsCount: json["items_count"],
    itemsQty: json["items_qty"],
    exchangeRate: json["exchange_rate"],
    globalCurrencyCode: json["global_currency_code"],
    baseCurrencyCode: json["base_currency_code"],
    channelCurrencyCode: json["channel_currency_code"],
    cartCurrencyCode: json["cart_currency_code"],
    grandTotal: json["grand_total"],
    formatedGrandTotal: json["formated_grand_total"],
    baseGrandTotal: json["base_grand_total"],
    formatedBaseGrandTotal: json["formated_base_grand_total"],
    subTotal: json["sub_total"],
    formatedSubTotal: json["formated_sub_total"],
    baseSubTotal: json["base_sub_total"],
    formatedBaseSubTotal: json["formated_base_sub_total"],
    taxTotal: json["tax_total"],
    formatedTaxTotal: json["formated_tax_total"],
    baseTaxTotal: json["base_tax_total"],
    formatedBaseTaxTotal: json["formated_base_tax_total"],
    discount: json["discount"],
    formatedDiscount: json["formated_discount"],
    baseDiscount: json["base_discount"],
    formatedBaseDiscount: json["formated_base_discount"],
    checkoutMethod: json["checkout_method"],
    isGuest: json["is_guest"],
    isActive: json["is_active"],
    conversionTime: json["conversion_time"],
    channel: json["channel"],
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
    selectedShippingRate: json["selected_shipping_rate"],
    payment: json["payment"],
    billingAddress: json["billing_address"],
    shippingAddress: json["shipping_address"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    taxes: json["taxes"],
    formatedTaxes: json["formated_taxes"],
    baseTaxes: json["base_taxes"],
    formatedBaseTaxes: json["formated_base_taxes"],
    formatedDiscountedSubTotal: json["formated_discounted_sub_total"],
    formatedBaseDiscountedSubTotal: json["formated_base_discounted_sub_total"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "customer_email": customerEmail,
    "customer_first_name": customerFirstName,
    "customer_last_name": customerLastName,
    "shipping_method": shippingMethod,
    "coupon_code": couponCode,
    "is_gift": isGift,
    "items_count": itemsCount,
    "items_qty": itemsQty,
    "exchange_rate": exchangeRate,
    "global_currency_code": globalCurrencyCode,
    "base_currency_code": baseCurrencyCode,
    "channel_currency_code": channelCurrencyCode,
    "cart_currency_code": cartCurrencyCode,
    "grand_total": grandTotal,
    "formated_grand_total": formatedGrandTotal,
    "base_grand_total": baseGrandTotal,
    "formated_base_grand_total": formatedBaseGrandTotal,
    "sub_total": subTotal,
    "formated_sub_total": formatedSubTotal,
    "base_sub_total": baseSubTotal,
    "formated_base_sub_total": formatedBaseSubTotal,
    "tax_total": taxTotal,
    "formated_tax_total": formatedTaxTotal,
    "base_tax_total": baseTaxTotal,
    "formated_base_tax_total": formatedBaseTaxTotal,
    "discount": discount,
    "formated_discount": formatedDiscount,
    "base_discount": baseDiscount,
    "formated_base_discount": formatedBaseDiscount,
    "checkout_method": checkoutMethod,
    "is_guest": isGuest,
    "is_active": isActive,
    "conversion_time": conversionTime,
    "channel": channel,
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
    "selected_shipping_rate": selectedShippingRate,
    "payment": payment,
    "billing_address": billingAddress,
    "shipping_address": shippingAddress,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "taxes": taxes,
    "formated_taxes": formatedTaxes,
    "base_taxes": baseTaxes,
    "formated_base_taxes": formatedBaseTaxes,
    "formated_discounted_sub_total": formatedDiscountedSubTotal,
    "formated_base_discounted_sub_total": formatedBaseDiscountedSubTotal,
  };
}

class Item {
  Item({
    this.id,
    this.quantity,
    this.sku,
    this.type,
    this.name,
    this.couponCode,
    this.weight,
    this.totalWeight,
    this.baseTotalWeight,
    this.price,
    this.formatedPrice,
    this.basePrice,
    this.formatedBasePrice,
    this.customPrice,
    this.formatedCustomPrice,
    this.total,
    this.formatedTotal,
    this.baseTotal,
    this.formatedBaseTotal,
    this.taxPercent,
    this.taxAmount,
    this.formatedTaxAmount,
    this.baseTaxAmount,
    this.formatedBaseTaxAmount,
    this.discountPercent,
    this.discountAmount,
    this.formatedDiscountAmount,
    this.baseDiscountAmount,
    this.formatedBaseDiscountAmount,
    // this.additional,
    this.child,
    this.product,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  int quantity;
  String sku;
  String type;
  String name;
  dynamic couponCode;
  String weight;
  String totalWeight;
  String baseTotalWeight;
  String price;
  String formatedPrice;
  String basePrice;
  String formatedBasePrice;
  dynamic customPrice;
  String formatedCustomPrice;
  String total;
  String formatedTotal;
  String baseTotal;
  String formatedBaseTotal;
  String taxPercent;
  String taxAmount;
  String formatedTaxAmount;
  String baseTaxAmount;
  String formatedBaseTaxAmount;
  String discountPercent;
  String discountAmount;
  String formatedDiscountAmount;
  String baseDiscountAmount;
  String formatedBaseDiscountAmount;
  // Additional additional;
  dynamic child;
  Product product;
  DateTime createdAt;
  DateTime updatedAt;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json["id"],
    quantity: json["quantity"],
    sku: json["sku"],
    type: json["type"],
    name: json["name"],
    couponCode: json["coupon_code"],
    weight: json["weight"],
    totalWeight: json["total_weight"],
    baseTotalWeight: json["base_total_weight"],
    price: json["price"],
    formatedPrice: json["formated_price"],
    basePrice: json["base_price"],
    formatedBasePrice: json["formated_base_price"],
    customPrice: json["custom_price"],
    formatedCustomPrice: json["formated_custom_price"],
    total: json["total"],
    formatedTotal: json["formated_total"],
    baseTotal: json["base_total"],
    formatedBaseTotal: json["formated_base_total"],
    taxPercent: json["tax_percent"],
    taxAmount: json["tax_amount"],
    formatedTaxAmount: json["formated_tax_amount"],
    baseTaxAmount: json["base_tax_amount"],
    formatedBaseTaxAmount: json["formated_base_tax_amount"],
    discountPercent: json["discount_percent"],
    discountAmount: json["discount_amount"],
    formatedDiscountAmount: json["formated_discount_amount"],
    baseDiscountAmount: json["base_discount_amount"],
    formatedBaseDiscountAmount: json["formated_base_discount_amount"],
    // additional: Additional.fromJson(json["additional"]),
    child: json["child"],
    product: Product.fromJson(json["product"]),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "quantity": quantity,
    "sku": sku,
    "type": type,
    "name": name,
    "coupon_code": couponCode,
    "weight": weight,
    "total_weight": totalWeight,
    "base_total_weight": baseTotalWeight,
    "price": price,
    "formated_price": formatedPrice,
    "base_price": basePrice,
    "formated_base_price": formatedBasePrice,
    "custom_price": customPrice,
    "formated_custom_price": formatedCustomPrice,
    "total": total,
    "formated_total": formatedTotal,
    "base_total": baseTotal,
    "formated_base_total": formatedBaseTotal,
    "tax_percent": taxPercent,
    "tax_amount": taxAmount,
    "formated_tax_amount": formatedTaxAmount,
    "base_tax_amount": baseTaxAmount,
    "formated_base_tax_amount": formatedBaseTaxAmount,
    "discount_percent": discountPercent,
    "discount_amount": discountAmount,
    "formated_discount_amount": formatedDiscountAmount,
    "base_discount_amount": baseDiscountAmount,
    "formated_base_discount_amount": formatedBaseDiscountAmount,
    // "additional": additional.toJson(),
    "child": child,
    "product": product.toJson(),
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class Additional {
  Additional({
    this.quantity,
    this.productId,
  });

  String quantity;
  String productId;

  factory Additional.fromJson(Map<String, dynamic> json) => Additional(
    quantity: json["quantity"],
    productId: json["product_id"],
  );

  Map<String, dynamic> toJson() => {
    "quantity": quantity,
    "product_id": productId,
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
    this.showQuantityChanger,
    this.specialPrice,
    this.formatedSpecialPrice,
    this.regularPrice,
    this.formatedRegularPrice,
  });

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
  List<Image> images;
  List<dynamic> videos;
  BaseImage baseImage;
  DateTime createdAt;
  DateTime updatedAt;
  Reviews reviews;
  bool inStock;
  bool isSaved;
  bool isWishlisted;
  bool isItemInCart;
  bool showQuantityChanger;
  String specialPrice;
  String formatedSpecialPrice;
  String regularPrice;
  String formatedRegularPrice;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    sku: json["sku"],
    type: json["type"],
    name: json["name"],
    urlKey: json["url_key"],
    price: json["price"],
    formatedPrice: json["formated_price"],
    shortDescription: json["short_description"],
    description: json["description"],
    category: List<Category>.from(json["category"].map((x) => Category.fromJson(x))),
    images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
    videos: List<dynamic>.from(json["videos"].map((x) => x)),
    baseImage: BaseImage.fromJson(json["base_image"]),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    reviews: Reviews.fromJson(json["reviews"]),
    inStock: json["in_stock"],
    isSaved: json["is_saved"],
    isWishlisted: json["is_wishlisted"],
    isItemInCart: json["is_item_in_cart"],
    showQuantityChanger: json["show_quantity_changer"],
    specialPrice: json["special_price"],
    formatedSpecialPrice: json["formated_special_price"],
    regularPrice: json["regular_price"],
    formatedRegularPrice: json["formated_regular_price"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "sku": sku,
    "type": type,
    "name": name,
    "url_key": urlKey,
    "price": price,
    "formated_price": formatedPrice,
    "short_description": shortDescription,
    "description": description,
    "category": List<dynamic>.from(category.map((x) => x.toJson())),
    "images": List<dynamic>.from(images.map((x) => x.toJson())),
    "videos": List<dynamic>.from(videos.map((x) => x)),
    "base_image": baseImage.toJson(),
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "reviews": reviews.toJson(),
    "in_stock": inStock,
    "is_saved": isSaved,
    "is_wishlisted": isWishlisted,
    "is_item_in_cart": isItemInCart,
    "show_quantity_changer": showQuantityChanger,
    "special_price": specialPrice,
    "formated_special_price": formatedSpecialPrice,
    "regular_price": regularPrice,
    "formated_regular_price": formatedRegularPrice,
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
  String metaDescription;
  String metaKeywords;
  int status;
  dynamic imageUrl;
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
