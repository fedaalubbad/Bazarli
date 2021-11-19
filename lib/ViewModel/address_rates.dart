// To parse this JSON data, do
//
//     final addressRates = addressRatesFromJson(jsonString);

import 'dart:convert';

AddressRates addressRatesFromJson(String str) => AddressRates.fromJson(json.decode(str));

String addressRatesToJson(AddressRates data) => json.encode(data.toJson());

class AddressRates {
  AddressRates({
    this.data,
  });

  Data data;

  factory AddressRates.fromJson(Map<String, dynamic> json) => AddressRates(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class Data {
  Data({
    this.rates,
    this.cart,
  });

  List<DataRate> rates;
  Cart cart;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    rates: List<DataRate>.from(json["rates"].map((x) => DataRate.fromJson(x))),
    cart: Cart.fromJson(json["cart"]),
  );

  Map<String, dynamic> toJson() => {
    "rates": List<dynamic>.from(rates.map((x) => x.toJson())),
    "cart": cart.toJson(),
  };
}

class Cart {
  Cart({
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
  String shippingMethod;
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
  SelectedShippingRateElement selectedShippingRate;
  Payment payment;
  IngAddress billingAddress;
  IngAddress shippingAddress;
  DateTime createdAt;
  DateTime updatedAt;
  String baseTaxes;
  String formatedBaseTaxes;
  String formatedDiscountedSubTotal;
  String formatedBaseDiscountedSubTotal;

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
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
    selectedShippingRate: SelectedShippingRateElement.fromJson(json["selected_shipping_rate"]),
    payment: json["payment"]==null?null:Payment.fromJson(json["payment"]),
    billingAddress: IngAddress.fromJson(json["billing_address"]),
    shippingAddress: IngAddress.fromJson(json["shipping_address"]),
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
    "selected_shipping_rate": selectedShippingRate.toJson(),
    "payment": payment==null?null:payment.toJson(),
    "billing_address": billingAddress.toJson(),
    "shipping_address": shippingAddress.toJson(),
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "base_taxes": baseTaxes,
    "formated_base_taxes": formatedBaseTaxes,
    "formated_discounted_sub_total": formatedDiscountedSubTotal,
    "formated_base_discounted_sub_total": formatedBaseDiscountedSubTotal,
  };
}

class IngAddress {
  IngAddress({
    this.id,
    this.firstName,
    this.lastName,
    this.name,
    this.email,
    this.address1,
    this.country,
    this.countryName,
    this.state,
    this.city,
    this.postcode,
    this.phone,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String firstName;
  String lastName;
  String name;
  dynamic email;
  List<String> address1;
  String country;
  String countryName;
  String state;
  String city;
  String postcode;
  String phone;
  DateTime createdAt;
  DateTime updatedAt;

  factory IngAddress.fromJson(Map<String, dynamic> json) => IngAddress(
    id: json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    name: json["name"],
    email: json["email"],
    address1: List<String>.from(json["address1"].map((x) => x)),
    country: json["country"],
    countryName: json["country_name"],
    state: json["state"],
    city: json["city"],
    postcode: json["postcode"],
    phone: json["phone"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "name": name,
    "email": email,
    "address1": List<dynamic>.from(address1.map((x) => x)),
    "country": country,
    "country_name": countryName,
    "state": state,
    "city": city,
    "postcode": postcode,
    "phone": phone,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
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
  String quantity;
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

class Payment {
  Payment({
    this.id,
    this.method,
    this.methodTitle,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String method;
  String methodTitle;
  DateTime createdAt;
  DateTime updatedAt;

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
    id: json["id"],
    method: json["method"],
    methodTitle: json["method_title"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "method": method,
    "method_title": methodTitle,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class SelectedShippingRateElement {
  SelectedShippingRateElement({
    this.id,
    this.carrier,
    this.carrierTitle,
    this.method,
    this.methodTitle,
    this.methodDescription,
    this.price,
    this.formatedPrice,
    this.basePrice,
    this.formatedBasePrice,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String carrier;
  String carrierTitle;
  String method;
  String methodTitle;
  String methodDescription;
  double price;
  String formatedPrice;
  int basePrice;
  String formatedBasePrice;
  DateTime createdAt;
  DateTime updatedAt;

  factory SelectedShippingRateElement.fromJson(Map<String, dynamic> json) => SelectedShippingRateElement(
    id: json["id"],
    carrier: json["carrier"],
    carrierTitle: json["carrier_title"],
    method: json["method"],
    methodTitle: json["method_title"],
    methodDescription: json["method_description"],
    price: json["price"].toDouble(),
    formatedPrice: json["formated_price"],
    basePrice: json["base_price"],
    formatedBasePrice: json["formated_base_price"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "carrier": carrier,
    "carrier_title": carrierTitle,
    "method": method,
    "method_title": methodTitle,
    "method_description": methodDescription,
    "price": price,
    "formated_price": formatedPrice,
    "base_price": basePrice,
    "formated_base_price": formatedBasePrice,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class DataRate {
  DataRate({
    this.carrierTitle,
    this.rates,
  });

  String carrierTitle;
  List<SelectedShippingRateElement> rates;

  factory DataRate.fromJson(Map<String, dynamic> json) => DataRate(
    carrierTitle: json["carrier_title"],
    rates: List<SelectedShippingRateElement>.from(json["rates"].map((x) => SelectedShippingRateElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "carrier_title": carrierTitle,
    "rates": List<dynamic>.from(rates.map((x) => x.toJson())),
  };
}
