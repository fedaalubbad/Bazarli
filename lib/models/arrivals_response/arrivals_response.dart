// To parse this JSON data, do
//
//     final arrivalsResponse = arrivalsResponseFromJson(jsonString);

import 'dart:convert';

List<ArrivalsResponse> arrivalsResponseFromJson(String str) => List<ArrivalsResponse>.from(json.decode(str).map((x) => ArrivalsResponse.fromJson(x)));

String arrivalsResponseToJson(List<ArrivalsResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ArrivalsResponse {
  ArrivalsResponse({
    this.arriveIn,
    this.count,
  });

  String arriveIn;
  int count;

  factory ArrivalsResponse.fromJson(Map<String, dynamic> json) => ArrivalsResponse(
    arriveIn: json["ArriveIn"],
    count: json["count"],
  );

  Map<String, dynamic> toJson() => {
    "ArriveIn": arriveIn,
    "count": count,
  };
}
