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
    this.taxes,
    this.formatedTaxes,
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
  List<dynamic> items;
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
    customer: json["customer"],
    channel: json["channel"],
    items: List<dynamic>.from(json["items"].map((x) => x)),
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
    "customer": customer,
    "channel": channel,
    "items": List<dynamic>.from(items.map((x) => x)),
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
