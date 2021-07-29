import 'dart:convert';
import 'customer_data.dart';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
  Login({
    this.token,
    this.message,
    this.data,
  });

  String token;
  String message;
  CustomerData data;
  factory Login.fromJson(Map<String, dynamic> json) => Login(
        token: json["token"],
        message: json["message"],
        data: CustomerData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "message": message,
        "data": data.toJson(),
      };
}
