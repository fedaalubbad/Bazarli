// To parse this JSON data, do
//
//     final getCitiesResponse = getCitiesResponseFromJson(jsonString);

import 'dart:convert';

List<GetCitiesResponse> getCitiesResponseFromJson(String str) => List<GetCitiesResponse>.from(json.decode(str).map((x) => GetCitiesResponse.fromJson(x)));

String getCitiesResponseToJson(List<GetCitiesResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetCitiesResponse {
  GetCitiesResponse({
    this.value,
    this.text,
  });

  int value;
  String text;

  factory GetCitiesResponse.fromJson(Map<String, dynamic> json) => GetCitiesResponse(
    value: json["value"],
    text: json["text"],
  );

  Map<String, dynamic> toJson() => {
    "value": value,
    "text": text,
  };
}
