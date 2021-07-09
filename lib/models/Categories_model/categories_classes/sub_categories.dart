class SubCategories {
  int id;
  String slug;
  String name;
  Null categoryIconPath;
  Null image;
  String code;
  // List<Null> subCategories;

  SubCategories(
      {this.id,
        this.slug,
        this.name,
        this.categoryIconPath,
        this.image,
        this.code,
        // this.subCategories
      });

  SubCategories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    name = json['name'];
    categoryIconPath = json['category_icon_path'];
    image = json['image'];
    code = json['code'];
    // if (json['subCategories'] != null) {
    //   subCategories = new List<Null>();
    //   json['subCategories'].forEach((v) {
    //     subCategories.add(new Null.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['slug'] = this.slug;
    data['name'] = this.name;
    data['category_icon_path'] = this.categoryIconPath;
    data['image'] = this.image;
    data['code'] = this.code;
    // if (this.subCategories != null) {
    //   data['subCategories'] =
    //       this.subCategories.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}