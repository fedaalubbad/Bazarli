import 'cart_items.dart';

class CartData {
  int id;
  String customerEmail;
  String customerFirstName;
  String customerLastName;
  Null shippingMethod;
  Null couponCode;
  int isGift;
  int itemsCount;
  String itemsQty;
  Null exchangeRate;
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
  Null checkoutMethod;
  int isGuest;
  int isActive;
  Null conversionTime;
  Null customer;
  Null channel;
  List<Items> items;
  Null selectedShippingRate;
  Null payment;
  Null billingAddress;
  Null shippingAddress;
  String createdAt;
  String updatedAt;
  String taxes;
  String formatedTaxes;
  String baseTaxes;
  String formatedBaseTaxes;
  String formatedDiscountedSubTotal;
  String formatedBaseDiscountedSubTotal;

  CartData(
      {this.id,
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
        this.formatedBaseDiscountedSubTotal});

  CartData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerEmail = json['customer_email'];
    customerFirstName = json['customer_first_name'];
    customerLastName = json['customer_last_name'];
    shippingMethod = json['shipping_method'];
    couponCode = json['coupon_code'];
    isGift = json['is_gift'];
    itemsCount = json['items_count'];
    itemsQty = json['items_qty'];
    exchangeRate = json['exchange_rate'];
    globalCurrencyCode = json['global_currency_code'];
    baseCurrencyCode = json['base_currency_code'];
    channelCurrencyCode = json['channel_currency_code'];
    cartCurrencyCode = json['cart_currency_code'];
    grandTotal = json['grand_total'];
    formatedGrandTotal = json['formated_grand_total'];
    baseGrandTotal = json['base_grand_total'];
    formatedBaseGrandTotal = json['formated_base_grand_total'];
    subTotal = json['sub_total'];
    formatedSubTotal = json['formated_sub_total'];
    baseSubTotal = json['base_sub_total'];
    formatedBaseSubTotal = json['formated_base_sub_total'];
    taxTotal = json['tax_total'];
    formatedTaxTotal = json['formated_tax_total'];
    baseTaxTotal = json['base_tax_total'];
    formatedBaseTaxTotal = json['formated_base_tax_total'];
    discount = json['discount'];
    formatedDiscount = json['formated_discount'];
    baseDiscount = json['base_discount'];
    formatedBaseDiscount = json['formated_base_discount'];
    checkoutMethod = json['checkout_method'];
    isGuest = json['is_guest'];
    isActive = json['is_active'];
    conversionTime = json['conversion_time'];
    customer = json['customer'];
    channel = json['channel'];
    if (json['items'] != null) {
      items = new List<Items>();
      json['items'].forEach((v) {
        items.add(new Items.fromJson(v));
      });
    }
    selectedShippingRate = json['selected_shipping_rate'];
    payment = json['payment'];
    billingAddress = json['billing_address'];
    shippingAddress = json['shipping_address'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    taxes = json['taxes'];
    formatedTaxes = json['formated_taxes'];
    baseTaxes = json['base_taxes'];
    formatedBaseTaxes = json['formated_base_taxes'];
    formatedDiscountedSubTotal = json['formated_discounted_sub_total'];
    formatedBaseDiscountedSubTotal = json['formated_base_discounted_sub_total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['customer_email'] = this.customerEmail;
    data['customer_first_name'] = this.customerFirstName;
    data['customer_last_name'] = this.customerLastName;
    data['shipping_method'] = this.shippingMethod;
    data['coupon_code'] = this.couponCode;
    data['is_gift'] = this.isGift;
    data['items_count'] = this.itemsCount;
    data['items_qty'] = this.itemsQty;
    data['exchange_rate'] = this.exchangeRate;
    data['global_currency_code'] = this.globalCurrencyCode;
    data['base_currency_code'] = this.baseCurrencyCode;
    data['channel_currency_code'] = this.channelCurrencyCode;
    data['cart_currency_code'] = this.cartCurrencyCode;
    data['grand_total'] = this.grandTotal;
    data['formated_grand_total'] = this.formatedGrandTotal;
    data['base_grand_total'] = this.baseGrandTotal;
    data['formated_base_grand_total'] = this.formatedBaseGrandTotal;
    data['sub_total'] = this.subTotal;
    data['formated_sub_total'] = this.formatedSubTotal;
    data['base_sub_total'] = this.baseSubTotal;
    data['formated_base_sub_total'] = this.formatedBaseSubTotal;
    data['tax_total'] = this.taxTotal;
    data['formated_tax_total'] = this.formatedTaxTotal;
    data['base_tax_total'] = this.baseTaxTotal;
    data['formated_base_tax_total'] = this.formatedBaseTaxTotal;
    data['discount'] = this.discount;
    data['formated_discount'] = this.formatedDiscount;
    data['base_discount'] = this.baseDiscount;
    data['formated_base_discount'] = this.formatedBaseDiscount;
    data['checkout_method'] = this.checkoutMethod;
    data['is_guest'] = this.isGuest;
    data['is_active'] = this.isActive;
    data['conversion_time'] = this.conversionTime;
    data['customer'] = this.customer;
    data['channel'] = this.channel;
    if (this.items != null) {
      data['items'] = this.items.map((v) => v.toJson()).toList();
    }
    data['selected_shipping_rate'] = this.selectedShippingRate;
    data['payment'] = this.payment;
    data['billing_address'] = this.billingAddress;
    data['shipping_address'] = this.shippingAddress;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['taxes'] = this.taxes;
    data['formated_taxes'] = this.formatedTaxes;
    data['base_taxes'] = this.baseTaxes;
    data['formated_base_taxes'] = this.formatedBaseTaxes;
    data['formated_discounted_sub_total'] = this.formatedDiscountedSubTotal;
    data['formated_base_discounted_sub_total'] =
        this.formatedBaseDiscountedSubTotal;
    return data;
  }
}
