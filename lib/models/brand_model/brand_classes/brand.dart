class Brands {
  int id;
  String adminName;
  int sortOrder;
  int attributeId;
  String swatchValue;
  String smallBrandLogo;
  String largeBrandLogo;

  Brands(
      {this.id,
        this.adminName,
        this.sortOrder,
        this.attributeId,
        this.swatchValue,
        this.smallBrandLogo,
        this.largeBrandLogo});
  Brands.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    adminName = json['admin_name'];
    sortOrder = json['sort_order'];
    attributeId = json['attribute_id'];
    swatchValue = json['swatch_value'];
    smallBrandLogo = json['small_brand_logo'];
    largeBrandLogo = json['large_brand_logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['admin_name'] = this.adminName;
    data['sort_order'] = this.sortOrder;
    data['attribute_id'] = this.attributeId;
    data['swatch_value'] = this.swatchValue;
    data['small_brand_logo'] = this.smallBrandLogo;
    data['large_brand_logo'] = this.largeBrandLogo;
    return data;
  }
}