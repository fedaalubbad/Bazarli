import 'classes/cart_data.dart';

class MoveToCartResponse {
  CartData data;
  String message;

  MoveToCartResponse({this.data, this.message});

  MoveToCartResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new CartData.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}