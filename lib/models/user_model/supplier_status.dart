
import 'package:bazarli/models/user_model/supplier_data.dart';

class SupplierLoginStatus {
  String message;
  SupplierData data;
  String token;

  SupplierLoginStatus({this.message, this.data, this.token});

  SupplierLoginStatus.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new SupplierData.fromJson(json['data']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}