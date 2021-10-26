// To parse this JSON data, do
//
//     final getAttributeFilter = getAttributeFilterFromJson(jsonString);

import 'dart:convert';

List<GetAttributeFilter> getAttributeFilterFromJson(String str) => List<GetAttributeFilter>.from(json.decode(str).map((x) => GetAttributeFilter.fromJson(x)));

String getAttributeFilterToJson(List<GetAttributeFilter> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetAttributeFilter {
  GetAttributeFilter({
    this.id,
    this.attribute,
    this.count,
    this.colorCode,
  });

  int id;
  String attribute;
  int count;
  String colorCode;

  factory GetAttributeFilter.fromJson(Map<String, dynamic> json) => GetAttributeFilter(
    id: json["id"],
    attribute: json["attribute"],
    count: json["count"],
    colorCode: json["color_code"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "attribute": attribute,
    "count": count,
    "color_code": colorCode,
  };
}
