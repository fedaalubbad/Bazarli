import 'customer_data.dart';

class LoginStatus {
  String message;
  CustomerData data;
  String token;

  LoginStatus({this.message, this.data, this.token});

  LoginStatus.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new CustomerData.fromJson(json['data']) : null;
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