import 'package:bazarli/models/product_model/product_classes/Data.dart';

import 'additional.dart';

class Items {
  int id;
  int quantity;
  String sku;
  String type;
  String name;
  Null couponCode;
  String weight;
  String totalWeight;
  String baseTotalWeight;
  String price;
  String formatedPrice;
  String basePrice;
  String formatedBasePrice;
  Null customPrice;
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
  Null child;
  Product product;
  String createdAt;
  String updatedAt;

  Items(
      {this.id,
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
        this.additional,
        this.child,
        this.product,
        this.createdAt,
        this.updatedAt});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    sku = json['sku'];
    type = json['type'];
    name = json['name'];
    couponCode = json['coupon_code'];
    weight = json['weight'];
    totalWeight = json['total_weight'];
    baseTotalWeight = json['base_total_weight'];
    price = json['price'];
    formatedPrice = json['formated_price'];
    basePrice = json['base_price'];
    formatedBasePrice = json['formated_base_price'];
    customPrice = json['custom_price'];
    formatedCustomPrice = json['formated_custom_price'];
    total = json['total'];
    formatedTotal = json['formated_total'];
    baseTotal = json['base_total'];
    formatedBaseTotal = json['formated_base_total'];
    taxPercent = json['tax_percent'];
    taxAmount = json['tax_amount'];
    formatedTaxAmount = json['formated_tax_amount'];
    baseTaxAmount = json['base_tax_amount'];
    formatedBaseTaxAmount = json['formated_base_tax_amount'];
    discountPercent = json['discount_percent'];
    discountAmount = json['discount_amount'];
    formatedDiscountAmount = json['formated_discount_amount'];
    baseDiscountAmount = json['base_discount_amount'];
    formatedBaseDiscountAmount = json['formated_base_discount_amount'];
    additional = json['additional'] != null
        ? new Additional.fromJson(json['additional'])
        : null;
    child = json['child'];
    product =
    json['product'] != null ? new Product.fromJson(json['product']) : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['quantity'] = this.quantity;
    data['sku'] = this.sku;
    data['type'] = this.type;
    data['name'] = this.name;
    data['coupon_code'] = this.couponCode;
    data['weight'] = this.weight;
    data['total_weight'] = this.totalWeight;
    data['base_total_weight'] = this.baseTotalWeight;
    data['price'] = this.price;
    data['formated_price'] = this.formatedPrice;
    data['base_price'] = this.basePrice;
    data['formated_base_price'] = this.formatedBasePrice;
    data['custom_price'] = this.customPrice;
    data['formated_custom_price'] = this.formatedCustomPrice;
    data['total'] = this.total;
    data['formated_total'] = this.formatedTotal;
    data['base_total'] = this.baseTotal;
    data['formated_base_total'] = this.formatedBaseTotal;
    data['tax_percent'] = this.taxPercent;
    data['tax_amount'] = this.taxAmount;
    data['formated_tax_amount'] = this.formatedTaxAmount;
    data['base_tax_amount'] = this.baseTaxAmount;
    data['formated_base_tax_amount'] = this.formatedBaseTaxAmount;
    data['discount_percent'] = this.discountPercent;
    data['discount_amount'] = this.discountAmount;
    data['formated_discount_amount'] = this.formatedDiscountAmount;
    data['base_discount_amount'] = this.baseDiscountAmount;
    data['formated_base_discount_amount'] = this.formatedBaseDiscountAmount;
    if (this.additional != null) {
      data['additional'] = this.additional.toJson();
    }
    data['child'] = this.child;
    if (this.product != null) {
      data['product'] = this.product.toJson();
    }
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}