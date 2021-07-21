import 'additional.dart';

class Items {
  int id;
  String sku;
  String type;
  String name;
  Null couponCode;
  String weight;
  String totalWeight;
  int qtyOrdered;
  int qtyShipped;
  int qtyInvoiced;
  int qtyCanceled;
  int qtyRefunded;
  String price;
  String basePrice;
  String total;
  String baseTotal;
  String totalInvoiced;
  String baseTotalInvoiced;
  String amountRefunded;
  String baseAmountRefunded;
  String discountPercent;
  String discountAmount;
  String baseDiscountAmount;
  String discountInvoiced;
  String baseDiscountInvoiced;
  String discountRefunded;
  String baseDiscountRefunded;
  String taxPercent;
  String taxAmount;
  String baseTaxAmount;
  String taxAmountInvoiced;
  String baseTaxAmountInvoiced;
  String taxAmountRefunded;
  String baseTaxAmountRefunded;
  int productId;
  String productType;
  int orderId;
  Null parentId;
  Additional additional;
  String createdAt;
  String updatedAt;
  int qtyToShip;
  int qtyToInvoice;
  int qtyToCancel;
  int qtyToRefund;
  List<Null> downloadableLinks;

  Items(
      {this.id,
        this.sku,
        this.type,
        this.name,
        this.couponCode,
        this.weight,
        this.totalWeight,
        this.qtyOrdered,
        this.qtyShipped,
        this.qtyInvoiced,
        this.qtyCanceled,
        this.qtyRefunded,
        this.price,
        this.basePrice,
        this.total,
        this.baseTotal,
        this.totalInvoiced,
        this.baseTotalInvoiced,
        this.amountRefunded,
        this.baseAmountRefunded,
        this.discountPercent,
        this.discountAmount,
        this.baseDiscountAmount,
        this.discountInvoiced,
        this.baseDiscountInvoiced,
        this.discountRefunded,
        this.baseDiscountRefunded,
        this.taxPercent,
        this.taxAmount,
        this.baseTaxAmount,
        this.taxAmountInvoiced,
        this.baseTaxAmountInvoiced,
        this.taxAmountRefunded,
        this.baseTaxAmountRefunded,
        this.productId,
        this.productType,
        this.orderId,
        this.parentId,
        this.additional,
        this.createdAt,
        this.updatedAt,
        this.qtyToShip,
        this.qtyToInvoice,
        this.qtyToCancel,
        this.qtyToRefund,
        this.downloadableLinks});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sku = json['sku'];
    type = json['type'];
    name = json['name'];
    couponCode = json['coupon_code'];
    weight = json['weight'];
    totalWeight = json['total_weight'];
    qtyOrdered = json['qty_ordered'];
    qtyShipped = json['qty_shipped'];
    qtyInvoiced = json['qty_invoiced'];
    qtyCanceled = json['qty_canceled'];
    qtyRefunded = json['qty_refunded'];
    price = json['price'];
    basePrice = json['base_price'];
    total = json['total'];
    baseTotal = json['base_total'];
    totalInvoiced = json['total_invoiced'];
    baseTotalInvoiced = json['base_total_invoiced'];
    amountRefunded = json['amount_refunded'];
    baseAmountRefunded = json['base_amount_refunded'];
    discountPercent = json['discount_percent'];
    discountAmount = json['discount_amount'];
    baseDiscountAmount = json['base_discount_amount'];
    discountInvoiced = json['discount_invoiced'];
    baseDiscountInvoiced = json['base_discount_invoiced'];
    discountRefunded = json['discount_refunded'];
    baseDiscountRefunded = json['base_discount_refunded'];
    taxPercent = json['tax_percent'];
    taxAmount = json['tax_amount'];
    baseTaxAmount = json['base_tax_amount'];
    taxAmountInvoiced = json['tax_amount_invoiced'];
    baseTaxAmountInvoiced = json['base_tax_amount_invoiced'];
    taxAmountRefunded = json['tax_amount_refunded'];
    baseTaxAmountRefunded = json['base_tax_amount_refunded'];
    productId = json['product_id'];
    productType = json['product_type'];
    orderId = json['order_id'];
    parentId = json['parent_id'];
    additional = json['additional'] != null
        ? new Additional.fromJson(json['additional'])
        : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    qtyToShip = json['qty_to_ship'];
    qtyToInvoice = json['qty_to_invoice'];
    qtyToCancel = json['qty_to_cancel'];
    qtyToRefund = json['qty_to_refund'];
    // if (json['downloadable_links'] != null) {
    //   downloadableLinks = new List<Null>();
    //   json['downloadable_links'].forEach((v) {
    //     downloadableLinks.add(new Null.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sku'] = this.sku;
    data['type'] = this.type;
    data['name'] = this.name;
    data['coupon_code'] = this.couponCode;
    data['weight'] = this.weight;
    data['total_weight'] = this.totalWeight;
    data['qty_ordered'] = this.qtyOrdered;
    data['qty_shipped'] = this.qtyShipped;
    data['qty_invoiced'] = this.qtyInvoiced;
    data['qty_canceled'] = this.qtyCanceled;
    data['qty_refunded'] = this.qtyRefunded;
    data['price'] = this.price;
    data['base_price'] = this.basePrice;
    data['total'] = this.total;
    data['base_total'] = this.baseTotal;
    data['total_invoiced'] = this.totalInvoiced;
    data['base_total_invoiced'] = this.baseTotalInvoiced;
    data['amount_refunded'] = this.amountRefunded;
    data['base_amount_refunded'] = this.baseAmountRefunded;
    data['discount_percent'] = this.discountPercent;
    data['discount_amount'] = this.discountAmount;
    data['base_discount_amount'] = this.baseDiscountAmount;
    data['discount_invoiced'] = this.discountInvoiced;
    data['base_discount_invoiced'] = this.baseDiscountInvoiced;
    data['discount_refunded'] = this.discountRefunded;
    data['base_discount_refunded'] = this.baseDiscountRefunded;
    data['tax_percent'] = this.taxPercent;
    data['tax_amount'] = this.taxAmount;
    data['base_tax_amount'] = this.baseTaxAmount;
    data['tax_amount_invoiced'] = this.taxAmountInvoiced;
    data['base_tax_amount_invoiced'] = this.baseTaxAmountInvoiced;
    data['tax_amount_refunded'] = this.taxAmountRefunded;
    data['base_tax_amount_refunded'] = this.baseTaxAmountRefunded;
    data['product_id'] = this.productId;
    data['product_type'] = this.productType;
    data['order_id'] = this.orderId;
    data['parent_id'] = this.parentId;
    if (this.additional != null) {
      data['additional'] = this.additional.toJson();
    }
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['qty_to_ship'] = this.qtyToShip;
    data['qty_to_invoice'] = this.qtyToInvoice;
    data['qty_to_cancel'] = this.qtyToCancel;
    data['qty_to_refund'] = this.qtyToRefund;
    // if (this.downloadableLinks != null) {
    //   data['downloadable_links'] =
    //       this.downloadableLinks.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}