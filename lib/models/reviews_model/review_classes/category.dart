class Category {
  int id;
  Null code;
  String name;
  String slug;
  String displayMode;
  String description;
  String metaTitle;
  String metaDescription;
  String metaKeywords;
  int status;
  Null imageUrl;
  Null additional;
  String createdAt;
  String updatedAt;

  Category(
      {this.id,
        this.code,
        this.name,
        this.slug,
        this.displayMode,
        this.description,
        this.metaTitle,
        this.metaDescription,
        this.metaKeywords,
        this.status,
        this.imageUrl,
        this.additional,
        this.createdAt,
        this.updatedAt});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    slug = json['slug'];
    displayMode = json['display_mode'];
    description = json['description'];
    metaTitle = json['meta_title'];
    metaDescription = json['meta_description'];
    metaKeywords = json['meta_keywords'];
    status = json['status'];
    imageUrl = json['image_url'];
    additional = json['additional'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['display_mode'] = this.displayMode;
    data['description'] = this.description;
    data['meta_title'] = this.metaTitle;
    data['meta_description'] = this.metaDescription;
    data['meta_keywords'] = this.metaKeywords;
    data['status'] = this.status;
    data['image_url'] = this.imageUrl;
    data['additional'] = this.additional;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}