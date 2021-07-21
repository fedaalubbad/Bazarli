import 'package:bazarli/models/supplier_order_model/supplier_order_classes/supplier_order_data.dart';

class SupplierOrdersResponse {
  String message;
  List<SupplierOrderData> data;

  SupplierOrdersResponse({this.message, this.data});

  SupplierOrdersResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = new List<SupplierOrderData>();
      json['data'].forEach((v) {
        data.add(new SupplierOrderData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}