// To parse this JSON data, do
//
//     final getCartResponse = getCartResponseFromJson(jsonString);

import 'dart:convert';

GetCartResponse getCartResponseFromJson(String str) => GetCartResponse.fromJson(json.decode(str));

String getCartResponseToJson(GetCartResponse data) => json.encode(data.toJson());

class GetCartResponse {
  GetCartResponse({
    this.data,
  });

  Data data;

  factory GetCartResponse.fromJson(Map<String, dynamic> json) => GetCartResponse(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
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
    this.customer,
    this.channel,
    this.items,
    this.selectedShippingRate,
    this.payment,
    this.billingAddress,
    this.shippingAddress,
    this.createdAt,
    this.updatedAt,
    this.baseTaxes,
    this.formatedBaseTaxes,
    this.formatedDiscountedSubTotal,
    this.formatedBaseDiscountedSubTotal,
  });

  int id;
  String customerEmail;
  String customerFirstName;
  String customerLastName;
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
  dynamic customer;
  dynamic channel;
  List<Item> items;
  dynamic selectedShippingRate;
  dynamic payment;
  dynamic billingAddress;
  dynamic shippingAddress;
  DateTime createdAt;
  DateTime updatedAt;
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
    customer: json["customer"],
    channel: json["channel"],
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
    selectedShippingRate: json["selected_shipping_rate"],
    payment: json["payment"],
    billingAddress: json["billing_address"],
    shippingAddress: json["shipping_address"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
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
    "customer": customer,
    "channel": channel,
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
    "selected_shipping_rate": selectedShippingRate,
    "payment": payment,
    "billing_address": billingAddress,
    "shipping_address": shippingAddress,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
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
    this.images,
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
    this.additional,
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
  Images images;
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
  Additional additional;
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
    images: Images.fromJson(json["images"]),
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
    additional: Additional.fromJson(json["additional"]),
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
    "images": images.toJson(),
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
    "additional": additional.toJson(),
    "child": child,
    "product": product.toJson(),
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class Additional {
  Additional({
    this.token,
    this.quantity,
    this.productId,
  });

  String token;
  dynamic quantity;
  String productId;

  factory Additional.fromJson(Map<String, dynamic> json) => Additional(
    token: json["token"],
    quantity: json["quantity"],
    productId: json["product_id"],
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "quantity": quantity,
    "product_id": productId,
  };
}

class Images {
  Images({
    this.smallImageUrl,
    this.mediumImageUrl,
    this.largeImageUrl,
    this.originalImageUrl,
  });

  String smallImageUrl;
  String mediumImageUrl;
  String largeImageUrl;
  String originalImageUrl;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
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

class Product {
  Product({
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

  factory Product.fromJson(Map<String, dynamic> json) => Product(
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
  dynamic label;

  factory Size.fromJson(Map<String, dynamic> json) => Size(
    id: json["id"],
    label: json["label"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "label": label,
  };
}
