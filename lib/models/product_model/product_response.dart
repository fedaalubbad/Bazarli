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
    this.superAttributes,
  });

  int id;
  String sku;
  String type;
  String name;
  String urlKey;
  dynamic price;
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
  List<dynamic> superAttributes;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    sku: json["sku"],
    type: json["type"],
    name: json["name"] == null ? null : json["name"],
    urlKey: json["url_key"],
    price: json["price"],
    formatedPrice: json["formated_price"],
    shortDescription: json["short_description"] == null ? null : json["short_description"],
    description: json["description"] == null ? null : json["description"],
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
    superAttributes: List<dynamic>.from(json["super_attributes"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "sku": sku,
    "type": type,
    "name": name == null ? null : name,
    "url_key": urlKey,
    "price": price,
    "formated_price": formatedPrice,
    "short_description": shortDescription == null ? null : shortDescription,
    "description": description == null ? null : description,
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
    "super_attributes": List<dynamic>.from(superAttributes.map((x) => x)),
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
  dynamic imageUrl;
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
    metaTitle: json["meta_title"] == null ? null : json["meta_title"],
    metaDescription: json["meta_description"],
    metaKeywords: json["meta_keywords"] == null ? null : json["meta_keywords"],
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
    "meta_title": metaTitle == null ? null : metaTitle,
    "meta_description": metaDescription,
    "meta_keywords": metaKeywords == null ? null : metaKeywords,
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
    this.links,
    this.batteryPowerMah,
    this.screenSize,
    this.cameraResolution,
    this.screenResolution,
    this.displayTechnology,
    this.frontCameraResolution,
    this.screenSizeRange,
    this.displayType,
    this.touchScreen,
    this.numberOfRearCameras,
    this.mainCameraFlash,
    this.numberOfFrontCameras,
    this.frontCameraResolutionRange,
    this.frontCameraFlash,
    this.os,
    this.processorBrand,
    this.ramCapacity,
    this.cpuRange,
    this.headphoneJack,
    this.batteryCapacityRange,
    this.chargeInput,
    this.chargeSpeed,
    this.wirelessCharging,
    this.mobileConnectionSpeed,
    this.bluetooth,
    this.gps,
    this.nfc,
    this.radio,
    this.fingerprintReader,
    this.faceRecognition,
    this.videoChat,
    this.waterdustResistance,
    this.doubleLine,
    this.screenRefreshRate,
    this.videoRecordingResolution,
    this.mainCameraResolutionRange,
    this.expandableMemoryMemoryCardSupport,
    this.typeOfBinding,
    this.usageArea,
    this.baseType,
    this.desen,
    this.kalip,
    this.materyal,
    this.yaka,
    this.renk,
    this.teknik,
    this.kumasIplik,
    this.urunTipi,
    this.kolBoyu,
    this.koleksiyon,
    this.shortDescription,
    this.description,
    this.merchantId,
    this.campaignId,
    this.name,
    this.urlKey,
    this.taxCategoryId,
    this.variantNew,
    this.featured,
    this.visibleIndividually,
    this.status,
    this.brand,
    this.guestCheckout,
    this.productNumber,
    this.importProductSize,
    this.listingId,
    this.metaTitle,
    this.metaKeywords,
    this.metaDescription,
    this.price,
    this.cost,
    this.specialPrice,
    this.specialPriceFrom,
    this.specialPriceTo,
    this.width,
    this.height,
    this.depth,
    this.weight,
    this.inventories,
    this.attributeFamily,
  });

  int id;
  String sku;
  Type type;
  DateTime createdAt;
  DateTime updatedAt;
  int parentId;
  int attributeFamilyId;
  dynamic supplierId;
  dynamic links;
  dynamic batteryPowerMah;
  dynamic screenSize;
  dynamic cameraResolution;
  dynamic screenResolution;
  dynamic displayTechnology;
  dynamic frontCameraResolution;
  dynamic screenSizeRange;
  dynamic displayType;
  dynamic touchScreen;
  dynamic numberOfRearCameras;
  dynamic mainCameraFlash;
  dynamic numberOfFrontCameras;
  dynamic frontCameraResolutionRange;
  dynamic frontCameraFlash;
  dynamic os;
  dynamic processorBrand;
  dynamic ramCapacity;
  dynamic cpuRange;
  dynamic headphoneJack;
  dynamic batteryCapacityRange;
  dynamic chargeInput;
  dynamic chargeSpeed;
  dynamic wirelessCharging;
  dynamic mobileConnectionSpeed;
  dynamic bluetooth;
  dynamic gps;
  dynamic nfc;
  dynamic radio;
  dynamic fingerprintReader;
  dynamic faceRecognition;
  dynamic videoChat;
  dynamic waterdustResistance;
  dynamic doubleLine;
  dynamic screenRefreshRate;
  dynamic videoRecordingResolution;
  dynamic mainCameraResolutionRange;
  dynamic expandableMemoryMemoryCardSupport;
  dynamic typeOfBinding;
  dynamic usageArea;
  dynamic baseType;
  dynamic desen;
  dynamic kalip;
  dynamic materyal;
  dynamic yaka;
  dynamic renk;
  dynamic teknik;
  dynamic kumasIplik;
  dynamic urunTipi;
  dynamic kolBoyu;
  dynamic koleksiyon;
  dynamic shortDescription;
  dynamic description;
  String merchantId;
  String campaignId;
  String name;
  String urlKey;
  dynamic taxCategoryId;
  dynamic variantNew;
  dynamic featured;
  dynamic visibleIndividually;
  int status;
  int brand;
  dynamic guestCheckout;
  dynamic productNumber;
  String importProductSize;
  String listingId;
  dynamic metaTitle;
  dynamic metaKeywords;
  dynamic metaDescription;
  String price;
  dynamic cost;
  dynamic specialPrice;
  dynamic specialPriceFrom;
  dynamic specialPriceTo;
  dynamic width;
  dynamic height;
  dynamic depth;
  dynamic weight;
  List<Inventory> inventories;
  AttributeFamily attributeFamily;

  factory Variant.fromJson(Map<String, dynamic> json) => Variant(
    id: json["id"],
    sku: json["sku"],
    type: typeValues.map[json["type"]],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    parentId: json["parent_id"],
    attributeFamilyId: json["attribute_family_id"],
    supplierId: json["supplier_id"],
    links: json["links"],
    batteryPowerMah: json["battery-power-mah"],
    screenSize: json["screen-size"],
    cameraResolution: json["camera-resolution"],
    screenResolution: json["screen-resolution"],
    displayTechnology: json["display-technology"],
    frontCameraResolution: json["front-camera-resolution"],
    screenSizeRange: json["screen-size-range"],
    displayType: json["display-type"],
    touchScreen: json["touch-screen"],
    numberOfRearCameras: json["number-of-rear-cameras"],
    mainCameraFlash: json["main-camera-flash"],
    numberOfFrontCameras: json["number-of-front-cameras"],
    frontCameraResolutionRange: json["front-camera-resolution-range"],
    frontCameraFlash: json["front-camera-flash"],
    os: json["os"],
    processorBrand: json["processor-brand"],
    ramCapacity: json["ram-capacity"],
    cpuRange: json["cpu-range"],
    headphoneJack: json["headphone-jack"],
    batteryCapacityRange: json["battery-capacity-range"],
    chargeInput: json["charge-input"],
    chargeSpeed: json["charge-speed"],
    wirelessCharging: json["wireless-charging"],
    mobileConnectionSpeed: json["mobile-connection-speed"],
    bluetooth: json["bluetooth"],
    gps: json["gps"],
    nfc: json["nfc"],
    radio: json["radio"],
    fingerprintReader: json["fingerprint-reader"],
    faceRecognition: json["face-recognition"],
    videoChat: json["video-chat"],
    waterdustResistance: json["waterdust-resistance"],
    doubleLine: json["double-line"],
    screenRefreshRate: json["screen-refresh-rate"],
    videoRecordingResolution: json["video-recording-resolution"],
    mainCameraResolutionRange: json["main-camera-resolution-range"],
    expandableMemoryMemoryCardSupport: json["expandable-memory-memory-card-support"],
    typeOfBinding: json["type-of-binding"],
    usageArea: json["usage-area"],
    baseType: json["base-type"],
    desen: json["desen"],
    kalip: json["kalip"],
    materyal: json["materyal"],
    yaka: json["yaka"],
    renk: json["renk"],
    teknik: json["teknik"],
    kumasIplik: json["kumas-iplik"],
    urunTipi: json["urun-tipi"],
    kolBoyu: json["kol-boyu"],
    koleksiyon: json["koleksiyon"],
    shortDescription: json["short_description"],
    description: json["description"],
    merchantId: json["merchant_id"],
    campaignId: json["campaign_id"],
    name: json["name"],
    urlKey: json["url_key"],
    taxCategoryId: json["tax_category_id"],
    variantNew: json["new"],
    featured: json["featured"],
    visibleIndividually: json["visible_individually"],
    status: json["status"],
    brand: json["brand"],
    guestCheckout: json["guest_checkout"],
    productNumber: json["product_number"],
    importProductSize: json["import_product_size"],
    listingId: json["listing_id"],
    metaTitle: json["meta_title"],
    metaKeywords: json["meta_keywords"],
    metaDescription: json["meta_description"],
    price: json["price"],
    cost: json["cost"],
    specialPrice: json["special_price"],
    specialPriceFrom: json["special_price_from"],
    specialPriceTo: json["special_price_to"],
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
    "type": typeValues.reverse[type],
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "parent_id": parentId,
    "attribute_family_id": attributeFamilyId,
    "supplier_id": supplierId,
    "links": links,
    "battery-power-mah": batteryPowerMah,
    "screen-size": screenSize,
    "camera-resolution": cameraResolution,
    "screen-resolution": screenResolution,
    "display-technology": displayTechnology,
    "front-camera-resolution": frontCameraResolution,
    "screen-size-range": screenSizeRange,
    "display-type": displayType,
    "touch-screen": touchScreen,
    "number-of-rear-cameras": numberOfRearCameras,
    "main-camera-flash": mainCameraFlash,
    "number-of-front-cameras": numberOfFrontCameras,
    "front-camera-resolution-range": frontCameraResolutionRange,
    "front-camera-flash": frontCameraFlash,
    "os": os,
    "processor-brand": processorBrand,
    "ram-capacity": ramCapacity,
    "cpu-range": cpuRange,
    "headphone-jack": headphoneJack,
    "battery-capacity-range": batteryCapacityRange,
    "charge-input": chargeInput,
    "charge-speed": chargeSpeed,
    "wireless-charging": wirelessCharging,
    "mobile-connection-speed": mobileConnectionSpeed,
    "bluetooth": bluetooth,
    "gps": gps,
    "nfc": nfc,
    "radio": radio,
    "fingerprint-reader": fingerprintReader,
    "face-recognition": faceRecognition,
    "video-chat": videoChat,
    "waterdust-resistance": waterdustResistance,
    "double-line": doubleLine,
    "screen-refresh-rate": screenRefreshRate,
    "video-recording-resolution": videoRecordingResolution,
    "main-camera-resolution-range": mainCameraResolutionRange,
    "expandable-memory-memory-card-support": expandableMemoryMemoryCardSupport,
    "type-of-binding": typeOfBinding,
    "usage-area": usageArea,
    "base-type": baseType,
    "desen": desen,
    "kalip": kalip,
    "materyal": materyal,
    "yaka": yaka,
    "renk": renk,
    "teknik": teknik,
    "kumas-iplik": kumasIplik,
    "urun-tipi": urunTipi,
    "kol-boyu": kolBoyu,
    "koleksiyon": koleksiyon,
    "short_description": shortDescription,
    "description": description,
    "merchant_id": merchantId,
    "campaign_id": campaignId,
    "name": name,
    "url_key": urlKey,
    "tax_category_id": taxCategoryId,
    "new": variantNew,
    "featured": featured,
    "visible_individually": visibleIndividually,
    "status": status,
    "brand": brand,
    "guest_checkout": guestCheckout,
    "product_number": productNumber,
    "import_product_size": importProductSize,
    "listing_id": listingId,
    "meta_title": metaTitle,
    "meta_keywords": metaKeywords,
    "meta_description": metaDescription,
    "price": price,
    "cost": cost,
    "special_price": specialPrice,
    "special_price_from": specialPriceFrom,
    "special_price_to": specialPriceTo,
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

enum Type { SIMPLE }

final typeValues = EnumValues({
  "simple": Type.SIMPLE
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
  dynamic next;

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
