// To parse this JSON data, do
//
//     final productResponse = productResponseFromJson(jsonString);

import 'dart:convert';

ProductResponse productResponseFromJson(String str) => ProductResponse.fromJson(json.decode(str));

String productResponseToJson(ProductResponse data) => json.encode(data.toJson());

class ProductResponse {
  ProductResponse({
    this.data,
    this.links,
    this.meta,
  });

  List<Datum> data;
  Links links;
  Meta meta;

  factory ProductResponse.fromJson(Map<String, dynamic> json) => ProductResponse(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    links: Links.fromJson(json["links"]),
    meta: Meta.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "links": links.toJson(),
    "meta": meta.toJson(),
  };
}

class Datum {
  Datum({
    this.id,
    this.sku,
    this.type,
    this.name,
    this.urlKey,
    this.price,
    this.formatedPrice,
    this.shortDescription,
    this.description,
    this.category,
    this.images,
    this.videos,
    this.baseImage,
    this.createdAt,
    this.updatedAt,
    this.reviews,
    this.inStock,
    this.isSaved,
    this.isWishlisted,
    this.isItemInCart,
    this.showQuantityChanger,
    this.variants,
    this.specialPrice,
    this.formatedSpecialPrice,
    this.regularPrice,
    this.formatedRegularPrice,
    this.superAttributes,
  });

  int id;
  String sku;
  String type;
  String name;
  String urlKey;
  String price;
  String formatedPrice;
  String shortDescription;
  String description;
  List<Category> category;
  List<Image> images;
  List<dynamic> videos;
  BaseImage baseImage;
  DateTime createdAt;
  DateTime updatedAt;
  Reviews reviews;
  bool inStock;
  bool isSaved;
  bool isWishlisted;
  bool isItemInCart;
  bool showQuantityChanger;
  List<Variant> variants;
  String specialPrice;
  String formatedSpecialPrice;
  String regularPrice;
  String formatedRegularPrice;
  List<SuperAttribute> superAttributes;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    sku: json["sku"],
    type: json["type"],
    name: json["name"],
    urlKey: json["url_key"],
    price: json["price"],
    formatedPrice: json["formated_price"],
    shortDescription: json["short_description"],
    description: json["description"],
    category: List<Category>.from(json["category"].map((x) => Category.fromJson(x))),
    images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
    videos: List<dynamic>.from(json["videos"].map((x) => x)),
    baseImage: BaseImage.fromJson(json["base_image"]),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    reviews: Reviews.fromJson(json["reviews"]),
    inStock: json["in_stock"],
    isSaved: json["is_saved"],
    isWishlisted: json["is_wishlisted"],
    isItemInCart: json["is_item_in_cart"],
    showQuantityChanger: json["show_quantity_changer"],
    variants: List<Variant>.from(json["variants"].map((x) => Variant.fromJson(x))),
    specialPrice: json["special_price"],
    formatedSpecialPrice: json["formated_special_price"],
    regularPrice: json["regular_price"],
    formatedRegularPrice: json["formated_regular_price"],
    superAttributes: List<SuperAttribute>.from(json["super_attributes"].map((x) => SuperAttribute.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "sku": sku,
    "type": type,
    "name": name,
    "url_key": urlKey,
    "price": price,
    "formated_price": formatedPrice,
    "short_description": shortDescription,
    "description": description,
    "category": List<dynamic>.from(category.map((x) => x.toJson())),
    "images": List<dynamic>.from(images.map((x) => x.toJson())),
    "videos": List<dynamic>.from(videos.map((x) => x)),
    "base_image": baseImage.toJson(),
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "reviews": reviews.toJson(),
    "in_stock": inStock,
    "is_saved": isSaved,
    "is_wishlisted": isWishlisted,
    "is_item_in_cart": isItemInCart,
    "show_quantity_changer": showQuantityChanger,
    "variants": List<dynamic>.from(variants.map((x) => x.toJson())),
    "special_price": specialPrice,
    "formated_special_price": formatedSpecialPrice,
    "regular_price": regularPrice,
    "formated_regular_price": formatedRegularPrice,
    "super_attributes": List<dynamic>.from(superAttributes.map((x) => x.toJson())),
  };
}

class BaseImage {
  BaseImage({
    this.smallImageUrl,
    this.mediumImageUrl,
    this.largeImageUrl,
    this.originalImageUrl,
  });

  String smallImageUrl;
  String mediumImageUrl;
  String largeImageUrl;
  String originalImageUrl;

  factory BaseImage.fromJson(Map<String, dynamic> json) => BaseImage(
    smallImageUrl: json["small_image_url"],
    mediumImageUrl: json["medium_image_url"],
    largeImageUrl: json["large_image_url"],
    originalImageUrl: json["original_image_url"],
  );

  Map<String, dynamic> toJson() => {
    "small_image_url": smallImageUrl,
    "medium_image_url": mediumImageUrl,
    "large_image_url": largeImageUrl,
    "original_image_url": originalImageUrl,
  };
}

class Category {
  Category({
    this.id,
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
    this.updatedAt,
  });

  int id;
  dynamic code;
  String name;
  String slug;
  String displayMode;
  String description;
  String metaTitle;
  dynamic metaDescription;
  String metaKeywords;
  int status;
  String imageUrl;
  dynamic additional;
  DateTime createdAt;
  DateTime updatedAt;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    code: json["code"],
    name: json["name"],
    slug: json["slug"],
    displayMode: json["display_mode"],
    description: json["description"],
    metaTitle: json["meta_title"],
    metaDescription: json["meta_description"],
    metaKeywords: json["meta_keywords"],
    status: json["status"],
    imageUrl: json["image_url"],
    additional: json["additional"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "code": code,
    "name": name,
    "slug": slug,
    "display_mode": displayMode,
    "description": description,
    "meta_title": metaTitle,
    "meta_description": metaDescription,
    "meta_keywords": metaKeywords,
    "status": status,
    "image_url": imageUrl,
    "additional": additional,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class Image {
  Image({
    this.id,
    this.path,
    this.url,
    this.originalImageUrl,
    this.smallImageUrl,
    this.mediumImageUrl,
    this.largeImageUrl,
  });

  int id;
  String path;
  String url;
  String originalImageUrl;
  String smallImageUrl;
  String mediumImageUrl;
  String largeImageUrl;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    id: json["id"],
    path: json["path"],
    url: json["url"],
    originalImageUrl: json["original_image_url"],
    smallImageUrl: json["small_image_url"],
    mediumImageUrl: json["medium_image_url"],
    largeImageUrl: json["large_image_url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "path": path,
    "url": url,
    "original_image_url": originalImageUrl,
    "small_image_url": smallImageUrl,
    "medium_image_url": mediumImageUrl,
    "large_image_url": largeImageUrl,
  };
}

class Reviews {
  Reviews({
    this.total,
    this.totalRating,
    this.averageRating,
    this.percentage,
  });

  int total;
  int totalRating;
  int averageRating;
  List<dynamic> percentage;

  factory Reviews.fromJson(Map<String, dynamic> json) => Reviews(
    total: json["total"],
    totalRating: json["total_rating"],
    averageRating: json["average_rating"],
    percentage: List<dynamic>.from(json["percentage"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "total_rating": totalRating,
    "average_rating": averageRating,
    "percentage": List<dynamic>.from(percentage.map((x) => x)),
  };
}

class SuperAttribute {
  SuperAttribute({
    this.id,
    this.code,
    this.type,
    this.name,
    this.swatchType,
    this.options,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  Code code;
  SuperAttributeType type;
  Name name;
  SwatchType swatchType;
  List<Option> options;
  DateTime createdAt;
  DateTime updatedAt;

  factory SuperAttribute.fromJson(Map<String, dynamic> json) => SuperAttribute(
    id: json["id"],
    code: codeValues.map[json["code"]],
    type: superAttributeTypeValues.map[json["type"]],
    name: nameValues.map[json["name"]],
    swatchType: swatchTypeValues.map[json["swatch_type"]],
    options: List<Option>.from(json["options"].map((x) => Option.fromJson(x))),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "code": codeValues.reverse[code],
    "type": superAttributeTypeValues.reverse[type],
    "name": nameValues.reverse[name],
    "swatch_type": swatchTypeValues.reverse[swatchType],
    "options": List<dynamic>.from(options.map((x) => x.toJson())),
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

enum Code { COLOR, SIZE }

final codeValues = EnumValues({
  "color": Code.COLOR,
  "size": Code.SIZE
});

enum Name { COLOR, SIZE }

final nameValues = EnumValues({
  "Color": Name.COLOR,
  "Size": Name.SIZE
});

class Option {
  Option({
    this.id,
    this.adminName,
    this.label,
    this.swatchValue,
  });

  int id;
  String adminName;
  String label;
  String swatchValue;

  factory Option.fromJson(Map<String, dynamic> json) => Option(
    id: json["id"],
    adminName: json["admin_name"],
    label: json["label"] == null ? null : json["label"],
    swatchValue: json["swatch_value"] == null ? null : json["swatch_value"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "admin_name": adminName,
    "label": label == null ? null : label,
    "swatch_value": swatchValue == null ? null : swatchValue,
  };
}

enum SwatchType { COLOR, DROPDOWN }

final swatchTypeValues = EnumValues({
  "color": SwatchType.COLOR,
  "dropdown": SwatchType.DROPDOWN
});

enum SuperAttributeType { SELECT }

final superAttributeTypeValues = EnumValues({
  "select": SuperAttributeType.SELECT
});

class Variant {
  Variant({
    this.id,
    this.sku,
    this.type,
    this.createdAt,
    this.updatedAt,
    this.parentId,
    this.attributeFamilyId,
    this.supplierId,
    this.materiel,
    this.pattern,
    this.armType,
    this.usageArea,
    this.fabricType,
    this.style,
    this.collar,
    this.colour,
    this.armLenght,
    this.skinType,
    this.additionalFeature,
    this.form,
    this.purposeOfUsage,
    this.typeOfBinding,
    this.exteriorMaterial,
    this.baseType,
    this.connection,
    this.audioFeature,
    this.activeNoiseCancellationAnc,
    this.watersweatResistance,
    this.microphone,
    this.warrantyPeriod,
    this.drawing,
    this.kolTipi,
    this.fabricYarn,
    this.productType,
    this.collection,
    this.wristStyle,
    this.ground,
    this.nailType,
    this.rim,
    this.bikeType,
    this.quick,
    this.brakeType,
    this.heightSize,
    this.closing,
    this.fabricTechnology,
    this.pocketType,
    this.property,
    this.model,
    this.technical,
    this.thickness,
    this.productDetail,
    this.pocket,
    this.packageIncluded,
    this.nice,
    this.trousersType,
    this.shortDescription,
    this.description,
    this.name,
    this.urlKey,
    this.taxCategoryId,
    this.variantNew,
    this.featured,
    this.visibleIndividually,
    this.status,
    this.color,
    this.size,
    this.brand,
    this.guestCheckout,
    this.productNumber,
    this.merchantId,
    this.campaignId,
    this.listingId,
    this.contentId,
    this.originalName,
    this.metaTitle,
    this.metaKeywords,
    this.metaDescription,
    this.price,
    this.cost,
    this.specialPrice,
    this.specialPriceFrom,
    this.specialPriceTo,
    this.savingPrice,
    this.width,
    this.height,
    this.depth,
    this.weight,
    this.inventories,
    this.attributeFamily,
  });

  int id;
  String sku;
  VariantType type;
  DateTime createdAt;
  DateTime updatedAt;
  int parentId;
  int attributeFamilyId;
  dynamic supplierId;
  Materiel materiel;
  Pattern pattern;
  dynamic armType;
  String usageArea;
  String fabricType;
  Style style;
  String collar;
  Colour colour;
  dynamic armLenght;
  dynamic skinType;
  dynamic additionalFeature;
  dynamic form;
  dynamic purposeOfUsage;
  dynamic typeOfBinding;
  dynamic exteriorMaterial;
  dynamic baseType;
  dynamic connection;
  dynamic audioFeature;
  dynamic activeNoiseCancellationAnc;
  dynamic watersweatResistance;
  dynamic microphone;
  dynamic warrantyPeriod;
  String drawing;
  String kolTipi;
  dynamic fabricYarn;
  dynamic productType;
  dynamic collection;
  dynamic wristStyle;
  dynamic ground;
  dynamic nailType;
  dynamic rim;
  dynamic bikeType;
  dynamic quick;
  dynamic brakeType;
  dynamic heightSize;
  dynamic closing;
  dynamic fabricTechnology;
  dynamic pocketType;
  dynamic property;
  dynamic model;
  dynamic technical;
  dynamic thickness;
  dynamic productDetail;
  dynamic pocket;
  dynamic packageIncluded;
  String nice;
  String trousersType;
  String shortDescription;
  String description;
  String name;
  String urlKey;
  dynamic taxCategoryId;
  int variantNew;
  int featured;
  int visibleIndividually;
  int status;
  int color;
  int size;
  int brand;
  dynamic guestCheckout;
  String productNumber;
  String merchantId;
  String campaignId;
  String listingId;
  String contentId;
  String originalName;
  dynamic metaTitle;
  dynamic metaKeywords;
  dynamic metaDescription;
  String price;
  dynamic cost;
  String specialPrice;
  dynamic specialPriceFrom;
  dynamic specialPriceTo;
  String savingPrice;
  dynamic width;
  dynamic height;
  dynamic depth;
  String weight;
  List<Inventory> inventories;
  AttributeFamily attributeFamily;

  factory Variant.fromJson(Map<String, dynamic> json) => Variant(
    id: json["id"],
    sku: json["sku"],
    type: variantTypeValues.map[json["type"]],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    parentId: json["parent_id"],
    attributeFamilyId: json["attribute_family_id"],
    supplierId: json["supplier_id"],
    materiel: json["materiel"] == null ? null : materielValues.map[json["materiel"]],
    pattern: json["pattern"] == null ? null : patternValues.map[json["pattern"]],
    armType: json["arm-type"],
    usageArea: json["usage-area"] == null ? null : json["usage-area"],
    fabricType: json["fabric-type"] == null ? null : json["fabric-type"],
    style: json["style"] == null ? null : styleValues.map[json["style"]],
    collar: json["collar"] == null ? null : json["collar"],
    colour: json["colour"] == null ? null : colourValues.map[json["colour"]],
    armLenght: json["arm-lenght"],
    skinType: json["skin-type"],
    additionalFeature: json["additional-feature"],
    form: json["form"],
    purposeOfUsage: json["purpose-of-usage"],
    typeOfBinding: json["type-of-binding"],
    exteriorMaterial: json["exterior-material"],
    baseType: json["base-type"],
    connection: json["connection"],
    audioFeature: json["audio-feature"],
    activeNoiseCancellationAnc: json["active-noise-cancellation-anc"],
    watersweatResistance: json["watersweat-resistance"],
    microphone: json["microphone"],
    warrantyPeriod: json["warranty-period"],
    drawing: json["drawing"] == null ? null : json["drawing"],
    kolTipi: json["kol-tipi"] == null ? null : json["kol-tipi"],
    fabricYarn: json["fabric-yarn"],
    productType: json["product-type"],
    collection: json["collection"],
    wristStyle: json["wrist-style"],
    ground: json["ground"],
    nailType: json["nail-type"],
    rim: json["rim"],
    bikeType: json["bike-type"],
    quick: json["quick"],
    brakeType: json["brake-type"],
    heightSize: json["height-size"],
    closing: json["closing"],
    fabricTechnology: json["fabric-technology"],
    pocketType: json["pocket-type"],
    property: json["property"],
    model: json["model"],
    technical: json["technical"],
    thickness: json["thickness"],
    productDetail: json["product-detail"],
    pocket: json["pocket"],
    packageIncluded: json["package-included"],
    nice: json["nice"] == null ? null : json["nice"],
    trousersType: json["trousers-type"] == null ? null : json["trousers-type"],
    shortDescription: json["short_description"],
    description: json["description"],
    name: json["name"],
    urlKey: json["url_key"],
    taxCategoryId: json["tax_category_id"],
    variantNew: json["new"],
    featured: json["featured"],
    visibleIndividually: json["visible_individually"],
    status: json["status"],
    color: json["color"] == null ? null : json["color"],
    size: json["size"],
    brand: json["brand"],
    guestCheckout: json["guest_checkout"],
    productNumber: json["product_number"],
    merchantId: json["merchant_id"],
    campaignId: json["campaign_id"],
    listingId: json["listing_id"],
    contentId: json["content_id"],
    originalName: json["original_name"],
    metaTitle: json["meta_title"],
    metaKeywords: json["meta_keywords"],
    metaDescription: json["meta_description"],
    price: json["price"],
    cost: json["cost"],
    specialPrice: json["special_price"],
    specialPriceFrom: json["special_price_from"],
    specialPriceTo: json["special_price_to"],
    savingPrice: json["saving_price"] == null ? null : json["saving_price"],
    width: json["width"],
    height: json["height"],
    depth: json["depth"],
    weight: json["weight"],
    inventories: json["inventories"] == null ? null : List<Inventory>.from(json["inventories"].map((x) => Inventory.fromJson(x))),
    attributeFamily: json["attribute_family"] == null ? null : AttributeFamily.fromJson(json["attribute_family"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "sku": sku,
    "type": variantTypeValues.reverse[type],
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "parent_id": parentId,
    "attribute_family_id": attributeFamilyId,
    "supplier_id": supplierId,
    "materiel": materiel == null ? null : materielValues.reverse[materiel],
    "pattern": pattern == null ? null : patternValues.reverse[pattern],
    "arm-type": armType,
    "usage-area": usageArea == null ? null : usageArea,
    "fabric-type": fabricType == null ? null : fabricType,
    "style": style == null ? null : styleValues.reverse[style],
    "collar": collar == null ? null : collar,
    "colour": colour == null ? null : colourValues.reverse[colour],
    "arm-lenght": armLenght,
    "skin-type": skinType,
    "additional-feature": additionalFeature,
    "form": form,
    "purpose-of-usage": purposeOfUsage,
    "type-of-binding": typeOfBinding,
    "exterior-material": exteriorMaterial,
    "base-type": baseType,
    "connection": connection,
    "audio-feature": audioFeature,
    "active-noise-cancellation-anc": activeNoiseCancellationAnc,
    "watersweat-resistance": watersweatResistance,
    "microphone": microphone,
    "warranty-period": warrantyPeriod,
    "drawing": drawing == null ? null : drawing,
    "kol-tipi": kolTipi == null ? null : kolTipi,
    "fabric-yarn": fabricYarn,
    "product-type": productType,
    "collection": collection,
    "wrist-style": wristStyle,
    "ground": ground,
    "nail-type": nailType,
    "rim": rim,
    "bike-type": bikeType,
    "quick": quick,
    "brake-type": brakeType,
    "height-size": heightSize,
    "closing": closing,
    "fabric-technology": fabricTechnology,
    "pocket-type": pocketType,
    "property": property,
    "model": model,
    "technical": technical,
    "thickness": thickness,
    "product-detail": productDetail,
    "pocket": pocket,
    "package-included": packageIncluded,
    "nice": nice == null ? null : nice,
    "trousers-type": trousersType == null ? null : trousersType,
    "short_description": shortDescription,
    "description": description,
    "name": name,
    "url_key": urlKey,
    "tax_category_id": taxCategoryId,
    "new": variantNew,
    "featured": featured,
    "visible_individually": visibleIndividually,
    "status": status,
    "color": color == null ? null : color,
    "size": size,
    "brand": brand,
    "guest_checkout": guestCheckout,
    "product_number": productNumber,
    "merchant_id": merchantId,
    "campaign_id": campaignId,
    "listing_id": listingId,
    "content_id": contentId,
    "original_name": originalName,
    "meta_title": metaTitle,
    "meta_keywords": metaKeywords,
    "meta_description": metaDescription,
    "price": price,
    "cost": cost,
    "special_price": specialPrice,
    "special_price_from": specialPriceFrom,
    "special_price_to": specialPriceTo,
    "saving_price": savingPrice == null ? null : savingPrice,
    "width": width,
    "height": height,
    "depth": depth,
    "weight": weight,
    "inventories": inventories == null ? null : List<dynamic>.from(inventories.map((x) => x.toJson())),
    "attribute_family": attributeFamily == null ? null : attributeFamily.toJson(),
  };
}

class AttributeFamily {
  AttributeFamily({
    this.id,
    this.code,
    this.name,
    this.status,
    this.isUserDefined,
  });

  int id;
  String code;
  String name;
  int status;
  int isUserDefined;

  factory AttributeFamily.fromJson(Map<String, dynamic> json) => AttributeFamily(
    id: json["id"],
    code: json["code"],
    name: json["name"],
    status: json["status"],
    isUserDefined: json["is_user_defined"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "code": code,
    "name": name,
    "status": status,
    "is_user_defined": isUserDefined,
  };
}

enum Colour { MOTHER, WHITE }

final colourValues = EnumValues({
  "Mother": Colour.MOTHER,
  "White": Colour.WHITE
});

class Inventory {
  Inventory({
    this.id,
    this.qty,
    this.productId,
    this.inventorySourceId,
    this.vendorId,
  });

  int id;
  int qty;
  int productId;
  int inventorySourceId;
  int vendorId;

  factory Inventory.fromJson(Map<String, dynamic> json) => Inventory(
    id: json["id"],
    qty: json["qty"],
    productId: json["product_id"],
    inventorySourceId: json["inventory_source_id"],
    vendorId: json["vendor_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "qty": qty,
    "product_id": productId,
    "inventory_source_id": inventorySourceId,
    "vendor_id": vendorId,
  };
}

enum Materiel { DENIM, COTTON }

final materielValues = EnumValues({
  "Cotton": Materiel.COTTON,
  "Denim": Materiel.DENIM
});

enum Pattern { BALLOON, SLIM_FIT }

final patternValues = EnumValues({
  "Balloon": Pattern.BALLOON,
  "Slim Fit": Pattern.SLIM_FIT
});

enum Style { STREET_STYLE }

final styleValues = EnumValues({
  "Street Style": Style.STREET_STYLE
});

enum VariantType { SIMPLE }

final variantTypeValues = EnumValues({
  "simple": VariantType.SIMPLE
});

class Links {
  Links({
    this.first,
    this.last,
    this.prev,
    this.next,
  });

  String first;
  String last;
  dynamic prev;
  String next;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    first: json["first"],
    last: json["last"],
    prev: json["prev"],
    next: json["next"],
  );

  Map<String, dynamic> toJson() => {
    "first": first,
    "last": last,
    "prev": prev,
    "next": next,
  };
}

class Meta {
  Meta({
    this.currentPage,
    this.from,
    this.lastPage,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  int currentPage;
  int from;
  int lastPage;
  String path;
  int perPage;
  int to;
  int total;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    currentPage: json["current_page"],
    from: json["from"],
    lastPage: json["last_page"],
    path: json["path"],
    perPage: json["per_page"],
    to: json["to"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "from": from,
    "last_page": lastPage,
    "path": path,
    "per_page": perPage,
    "to": to,
    "total": total,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
