
import 'dart:convert';

BrandResponse brandResponseFromJson(String str) => BrandResponse.fromJson(json.decode(str));

String brandResponseToJson(BrandResponse data) => json.encode(data.toJson());

class BrandResponse {
  BrandResponse({
    this.brands,
  });

  List<Brand> brands;

  factory BrandResponse.fromJson(Map<String, dynamic> json) => BrandResponse(
    brands: List<Brand>.from(json["brands"].map((x) => Brand.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "brands": List<dynamic>.from(brands.map((x) => x.toJson())),
  };
}

class Brand {
  Brand({
    this.id,
    this.adminName,
    this.sortOrder,
    this.attributeId,
    this.swatchValue,
    this.smallBrandLogo,
    this.largeBrandLogo,
  });

  int id;
  String adminName;
  int sortOrder;
  int attributeId;
  String swatchValue;
  String smallBrandLogo;
  String largeBrandLogo;

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
    id: json["id"],
    adminName: json["admin_name"],
    sortOrder: json["sort_order"],
    attributeId: json["attribute_id"],
    swatchValue: json["swatch_value"],
    smallBrandLogo: json["small_brand_logo"],
    largeBrandLogo: json["large_brand_logo"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "admin_name": adminName,
    "sort_order": sortOrder,
    "attribute_id": attributeId,
    "swatch_value": swatchValue,
    "small_brand_logo": smallBrandLogo,
    "large_brand_logo": largeBrandLogo,
  };
}
