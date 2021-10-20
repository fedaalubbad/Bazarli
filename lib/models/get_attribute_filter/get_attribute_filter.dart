// To parse this JSON data, do
//
//     final getAttributeFilter = getAttributeFilterFromJson(jsonString);

import 'dart:convert';

List<GetAttributeFilter> getAttributeFilterFromJson(String str) => List<GetAttributeFilter>.from(json.decode(str).map((x) => GetAttributeFilter.fromJson(x)));

String getAttributeFilterToJson(List<GetAttributeFilter> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetAttributeFilter {
  GetAttributeFilter({
    this.attribute,
    this.colorCode,
    this.count,
  });

  String attribute;
  String colorCode;
  int count;

  factory GetAttributeFilter.fromJson(Map<String, dynamic> json) => GetAttributeFilter(
    attribute: json["attribute"],
    colorCode: json["color_code"],
    count: json["count"],
  );

  Map<String, dynamic> toJson() => {
    "attribute": attribute,
    "color_code": colorCode,
    "count": count,
  };
}
