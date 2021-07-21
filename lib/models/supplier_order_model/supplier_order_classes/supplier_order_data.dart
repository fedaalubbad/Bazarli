import 'items.dart';

class SupplierOrderData {
  int id;
  String incrementId;
  String status;
  String channelName;
  int isGuest;
  String customerEmail;
  String customerFirstName;
  String customerLastName;
  Null customerCompanyName;
  Null customerVatId;
  String shippingMethod;
  String shippingTitle;
  String shippingDescription;
  Null couponCode;
  int isGift;
  int totalItemCount;
  int totalQtyOrdered;
  String baseCurrencyCode;
  String channelCurrencyCode;
  String orderCurrencyCode;
  String grandTotal;
  String baseGrandTotal;
  String grandTotalInvoiced;
  String baseGrandTotalInvoiced;
  String grandTotalRefunded;
  String baseGrandTotalRefunded;
  String subTotal;
  String baseSubTotal;
  String subTotalInvoiced;
  String baseSubTotalInvoiced;
  String subTotalRefunded;
  String baseSubTotalRefunded;
  String discountPercent;
  String discountAmount;
  String baseDiscountAmount;
  String discountInvoiced;
  String baseDiscountInvoiced;
  String discountRefunded;
  String baseDiscountRefunded;
  String taxAmount;
  String baseTaxAmount;
  String taxAmountInvoiced;
  String baseTaxAmountInvoiced;
  String taxAmountRefunded;
  String baseTaxAmountRefunded;
  String shippingAmount;
  String baseShippingAmount;
  String shippingInvoiced;
  String baseShippingInvoiced;
  String shippingRefunded;
  String baseShippingRefunded;
  int customerId;
  String customerType;
  int channelId;
  String channelType;
  String createdAt;
  String updatedAt;
  int cartId;
  String appliedCartRuleIds;
  String shippingDiscountAmount;
  String baseShippingDiscountAmount;
  List<Items> items;

  SupplierOrderData(
      {this.id,
        this.incrementId,
        this.status,
        this.channelName,
        this.isGuest,
        this.customerEmail,
        this.customerFirstName,
        this.customerLastName,
        this.customerCompanyName,
        this.customerVatId,
        this.shippingMethod,
        this.shippingTitle,
        this.shippingDescription,
        this.couponCode,
        this.isGift,
        this.totalItemCount,
        this.totalQtyOrdered,
        this.baseCurrencyCode,
        this.channelCurrencyCode,
        this.orderCurrencyCode,
        this.grandTotal,
        this.baseGrandTotal,
        this.grandTotalInvoiced,
        this.baseGrandTotalInvoiced,
        this.grandTotalRefunded,
        this.baseGrandTotalRefunded,
        this.subTotal,
        this.baseSubTotal,
        this.subTotalInvoiced,
        this.baseSubTotalInvoiced,
        this.subTotalRefunded,
        this.baseSubTotalRefunded,
        this.discountPercent,
        this.discountAmount,
        this.baseDiscountAmount,
        this.discountInvoiced,
        this.baseDiscountInvoiced,
        this.discountRefunded,
        this.baseDiscountRefunded,
        this.taxAmount,
        this.baseTaxAmount,
        this.taxAmountInvoiced,
        this.baseTaxAmountInvoiced,
        this.taxAmountRefunded,
        this.baseTaxAmountRefunded,
        this.shippingAmount,
        this.baseShippingAmount,
        this.shippingInvoiced,
        this.baseShippingInvoiced,
        this.shippingRefunded,
        this.baseShippingRefunded,
        this.customerId,
        this.customerType,
        this.channelId,
        this.channelType,
        this.createdAt,
        this.updatedAt,
        this.cartId,
        this.appliedCartRuleIds,
        this.shippingDiscountAmount,
        this.baseShippingDiscountAmount,
        this.items});

  SupplierOrderData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    incrementId = json['increment_id'];
    status = json['status'];
    channelName = json['channel_name'];
    isGuest = json['is_guest'];
    customerEmail = json['customer_email'];
    customerFirstName = json['customer_first_name'];
    customerLastName = json['customer_last_name'];
    customerCompanyName = json['customer_company_name'];
    customerVatId = json['customer_vat_id'];
    shippingMethod = json['shipping_method'];
    shippingTitle = json['shipping_title'];
    shippingDescription = json['shipping_description'];
    couponCode = json['coupon_code'];
    isGift = json['is_gift'];
    totalItemCount = json['total_item_count'];
    totalQtyOrdered = json['total_qty_ordered'];
    baseCurrencyCode = json['base_currency_code'];
    channelCurrencyCode = json['channel_currency_code'];
    orderCurrencyCode = json['order_currency_code'];
    grandTotal = json['grand_total'];
    baseGrandTotal = json['base_grand_total'];
    grandTotalInvoiced = json['grand_total_invoiced'];
    baseGrandTotalInvoiced = json['base_grand_total_invoiced'];
    grandTotalRefunded = json['grand_total_refunded'];
    baseGrandTotalRefunded = json['base_grand_total_refunded'];
    subTotal = json['sub_total'];
    baseSubTotal = json['base_sub_total'];
    subTotalInvoiced = json['sub_total_invoiced'];
    baseSubTotalInvoiced = json['base_sub_total_invoiced'];
    subTotalRefunded = json['sub_total_refunded'];
    baseSubTotalRefunded = json['base_sub_total_refunded'];
    discountPercent = json['discount_percent'];
    discountAmount = json['discount_amount'];
    baseDiscountAmount = json['base_discount_amount'];
    discountInvoiced = json['discount_invoiced'];
    baseDiscountInvoiced = json['base_discount_invoiced'];
    discountRefunded = json['discount_refunded'];
    baseDiscountRefunded = json['base_discount_refunded'];
    taxAmount = json['tax_amount'];
    baseTaxAmount = json['base_tax_amount'];
    taxAmountInvoiced = json['tax_amount_invoiced'];
    baseTaxAmountInvoiced = json['base_tax_amount_invoiced'];
    taxAmountRefunded = json['tax_amount_refunded'];
    baseTaxAmountRefunded = json['base_tax_amount_refunded'];
    shippingAmount = json['shipping_amount'];
    baseShippingAmount = json['base_shipping_amount'];
    shippingInvoiced = json['shipping_invoiced'];
    baseShippingInvoiced = json['base_shipping_invoiced'];
    shippingRefunded = json['shipping_refunded'];
    baseShippingRefunded = json['base_shipping_refunded'];
    customerId = json['customer_id'];
    customerType = json['customer_type'];
    channelId = json['channel_id'];
    channelType = json['channel_type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    cartId = json['cart_id'];
    appliedCartRuleIds = json['applied_cart_rule_ids'];
    shippingDiscountAmount = json['shipping_discount_amount'];
    baseShippingDiscountAmount = json['base_shipping_discount_amount'];
    if (json['items'] != null) {
      items = new List<Items>();
      json['items'].forEach((v) {
        items.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['increment_id'] = this.incrementId;
    data['status'] = this.status;
    data['channel_name'] = this.channelName;
    data['is_guest'] = this.isGuest;
    data['customer_email'] = this.customerEmail;
    data['customer_first_name'] = this.customerFirstName;
    data['customer_last_name'] = this.customerLastName;
    data['customer_company_name'] = this.customerCompanyName;
    data['customer_vat_id'] = this.customerVatId;
    data['shipping_method'] = this.shippingMethod;
    data['shipping_title'] = this.shippingTitle;
    data['shipping_description'] = this.shippingDescription;
    data['coupon_code'] = this.couponCode;
    data['is_gift'] = this.isGift;
    data['total_item_count'] = this.totalItemCount;
    data['total_qty_ordered'] = this.totalQtyOrdered;
    data['base_currency_code'] = this.baseCurrencyCode;
    data['channel_currency_code'] = this.channelCurrencyCode;
    data['order_currency_code'] = this.orderCurrencyCode;
    data['grand_total'] = this.grandTotal;
    data['base_grand_total'] = this.baseGrandTotal;
    data['grand_total_invoiced'] = this.grandTotalInvoiced;
    data['base_grand_total_invoiced'] = this.baseGrandTotalInvoiced;
    data['grand_total_refunded'] = this.grandTotalRefunded;
    data['base_grand_total_refunded'] = this.baseGrandTotalRefunded;
    data['sub_total'] = this.subTotal;
    data['base_sub_total'] = this.baseSubTotal;
    data['sub_total_invoiced'] = this.subTotalInvoiced;
    data['base_sub_total_invoiced'] = this.baseSubTotalInvoiced;
    data['sub_total_refunded'] = this.subTotalRefunded;
    data['base_sub_total_refunded'] = this.baseSubTotalRefunded;
    data['discount_percent'] = this.discountPercent;
    data['discount_amount'] = this.discountAmount;
    data['base_discount_amount'] = this.baseDiscountAmount;
    data['discount_invoiced'] = this.discountInvoiced;
    data['base_discount_invoiced'] = this.baseDiscountInvoiced;
    data['discount_refunded'] = this.discountRefunded;
    data['base_discount_refunded'] = this.baseDiscountRefunded;
    data['tax_amount'] = this.taxAmount;
    data['base_tax_amount'] = this.baseTaxAmount;
    data['tax_amount_invoiced'] = this.taxAmountInvoiced;
    data['base_tax_amount_invoiced'] = this.baseTaxAmountInvoiced;
    data['tax_amount_refunded'] = this.taxAmountRefunded;
    data['base_tax_amount_refunded'] = this.baseTaxAmountRefunded;
    data['shipping_amount'] = this.shippingAmount;
    data['base_shipping_amount'] = this.baseShippingAmount;
    data['shipping_invoiced'] = this.shippingInvoiced;
    data['base_shipping_invoiced'] = this.baseShippingInvoiced;
    data['shipping_refunded'] = this.shippingRefunded;
    data['base_shipping_refunded'] = this.baseShippingRefunded;
    data['customer_id'] = this.customerId;
    data['customer_type'] = this.customerType;
    data['channel_id'] = this.channelId;
    data['channel_type'] = this.channelType;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['cart_id'] = this.cartId;
    data['applied_cart_rule_ids'] = this.appliedCartRuleIds;
    data['shipping_discount_amount'] = this.shippingDiscountAmount;
    data['base_shipping_discount_amount'] = this.baseShippingDiscountAmount;
    if (this.items != null) {
      data['items'] = this.items.map((v) => v.toJson()).toList();
    }
    return data;
  }
}