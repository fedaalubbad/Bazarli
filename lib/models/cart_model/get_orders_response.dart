// To parse this JSON data, do
//
//     final getOrderResponse = getOrderResponseFromJson(jsonString);

import 'dart:convert';

GetOrderResponse getOrderResponseFromJson(String str) => GetOrderResponse.fromJson(json.decode(str));

String getOrderResponseToJson(GetOrderResponse data) => json.encode(data.toJson());

class GetOrderResponse {
  GetOrderResponse({
    this.data,
    this.links,
    this.meta,
  });

  List<Datum> data;
  Links links;
  Meta meta;

  factory GetOrderResponse.fromJson(Map<String, dynamic> json) => GetOrderResponse(
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
    this.incrementId,
    this.status,
    this.statusLabel,
    this.channelName,
    this.isGuest,
    this.customerEmail,
    this.customerFirstName,
    this.customerLastName,
    this.shippingMethod,
    this.shippingTitle,
    this.paymentTitle,
    this.shippingDescription,
    this.couponCode,
    this.isGift,
    this.totalItemCount,
    this.totalQtyOrdered,
    this.baseCurrencyCode,
    this.channelCurrencyCode,
    this.orderCurrencyCode,
    this.grandTotal,
    this.formatedGrandTotal,
    this.baseGrandTotal,
    this.formatedBaseGrandTotal,
    this.grandTotalInvoiced,
    this.formatedGrandTotalInvoiced,
    this.baseGrandTotalInvoiced,
    this.formatedBaseGrandTotalInvoiced,
    this.grandTotalRefunded,
    this.formatedGrandTotalRefunded,
    this.baseGrandTotalRefunded,
    this.formatedBaseGrandTotalRefunded,
    this.subTotal,
    this.formatedSubTotal,
    this.baseSubTotal,
    this.formatedBaseSubTotal,
    this.subTotalInvoiced,
    this.formatedSubTotalInvoiced,
    this.baseSubTotalInvoiced,
    this.formatedBaseSubTotalInvoiced,
    this.subTotalRefunded,
    this.formatedSubTotalRefunded,
    this.discountPercent,
    this.discountAmount,
    this.formatedDiscountAmount,
    this.baseDiscountAmount,
    this.formatedBaseDiscountAmount,
    this.discountInvoiced,
    this.formatedDiscountInvoiced,
    this.baseDiscountInvoiced,
    this.formatedBaseDiscountInvoiced,
    this.discountRefunded,
    this.formatedDiscountRefunded,
    this.baseDiscountRefunded,
    this.formatedBaseDiscountRefunded,
    this.taxAmount,
    this.formatedTaxAmount,
    this.baseTaxAmount,
    this.formatedBaseTaxAmount,
    this.taxAmountInvoiced,
    this.formatedTaxAmountInvoiced,
    this.baseTaxAmountInvoiced,
    this.formatedBaseTaxAmountInvoiced,
    this.taxAmountRefunded,
    this.formatedTaxAmountRefunded,
    this.baseTaxAmountRefunded,
    this.formatedBaseTaxAmountRefunded,
    this.shippingAmount,
    this.formatedShippingAmount,
    this.baseShippingAmount,
    this.formatedBaseShippingAmount,
    this.shippingInvoiced,
    this.formatedShippingInvoiced,
    this.baseShippingInvoiced,
    this.formatedBaseShippingInvoiced,
    this.shippingRefunded,
    this.formatedShippingRefunded,
    this.baseShippingRefunded,
    this.formatedBaseShippingRefunded,
    this.customer,
    this.channel,
    this.shippingAddress,
    this.billingAddress,
    this.items,
    this.invoices,
    this.shipments,
    this.updatedAt,
    this.createdAt,
  });

  int id;
  String incrementId;
  String status;
  String statusLabel;
  String channelName;
  int isGuest;
  String customerEmail;
  String customerFirstName;
  String customerLastName;
  String shippingMethod;
  String shippingTitle;
  String paymentTitle;
  String shippingDescription;
  dynamic couponCode;
  int isGift;
  int totalItemCount;
  int totalQtyOrdered;
  String baseCurrencyCode;
  String channelCurrencyCode;
  String orderCurrencyCode;
  String grandTotal;
  String formatedGrandTotal;
  String baseGrandTotal;
  String formatedBaseGrandTotal;
  String grandTotalInvoiced;
  String formatedGrandTotalInvoiced;
  String baseGrandTotalInvoiced;
  String formatedBaseGrandTotalInvoiced;
  String grandTotalRefunded;
  String formatedGrandTotalRefunded;
  String baseGrandTotalRefunded;
  String formatedBaseGrandTotalRefunded;
  String subTotal;
  String formatedSubTotal;
  String baseSubTotal;
  String formatedBaseSubTotal;
  String subTotalInvoiced;
  String formatedSubTotalInvoiced;
  String baseSubTotalInvoiced;
  String formatedBaseSubTotalInvoiced;
  String subTotalRefunded;
  String formatedSubTotalRefunded;
  String discountPercent;
  String discountAmount;
  String formatedDiscountAmount;
  String baseDiscountAmount;
  String formatedBaseDiscountAmount;
  String discountInvoiced;
  String formatedDiscountInvoiced;
  String baseDiscountInvoiced;
  String formatedBaseDiscountInvoiced;
  String discountRefunded;
  String formatedDiscountRefunded;
  String baseDiscountRefunded;
  String formatedBaseDiscountRefunded;
  String taxAmount;
  String formatedTaxAmount;
  String baseTaxAmount;
  String formatedBaseTaxAmount;
  String taxAmountInvoiced;
  String formatedTaxAmountInvoiced;
  String baseTaxAmountInvoiced;
  String formatedBaseTaxAmountInvoiced;
  String taxAmountRefunded;
  String formatedTaxAmountRefunded;
  String baseTaxAmountRefunded;
  String formatedBaseTaxAmountRefunded;
  String shippingAmount;
  String formatedShippingAmount;
  String baseShippingAmount;
  String formatedBaseShippingAmount;
  String shippingInvoiced;
  String formatedShippingInvoiced;
  String baseShippingInvoiced;
  String formatedBaseShippingInvoiced;
  String shippingRefunded;
  String formatedShippingRefunded;
  String baseShippingRefunded;
  String formatedBaseShippingRefunded;
  Customer customer;
  Channel channel;
  IngAddress shippingAddress;
  IngAddress billingAddress;
  List<Item> items;
  List<dynamic> invoices;
  List<dynamic> shipments;
  DateTime updatedAt;
  DateTime createdAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    incrementId: json["increment_id"],
    status: json["status"],
    statusLabel: json["status_label"],
    channelName: json["channel_name"],
    isGuest: json["is_guest"],
    customerEmail: json["customer_email"],
    customerFirstName: json["customer_first_name"],
    customerLastName: json["customer_last_name"],
    shippingMethod: json["shipping_method"],
    shippingTitle: json["shipping_title"],
    paymentTitle: json["payment_title"],
    shippingDescription: json["shipping_description"],
    couponCode: json["coupon_code"],
    isGift: json["is_gift"],
    totalItemCount: json["total_item_count"],
    totalQtyOrdered: json["total_qty_ordered"],
    baseCurrencyCode: json["base_currency_code"],
    channelCurrencyCode: json["channel_currency_code"],
    orderCurrencyCode: json["order_currency_code"],
    grandTotal: json["grand_total"],
    formatedGrandTotal: json["formated_grand_total"],
    baseGrandTotal: json["base_grand_total"],
    formatedBaseGrandTotal: json["formated_base_grand_total"],
    grandTotalInvoiced: json["grand_total_invoiced"],
    formatedGrandTotalInvoiced: json["formated_grand_total_invoiced"],
    baseGrandTotalInvoiced: json["base_grand_total_invoiced"],
    formatedBaseGrandTotalInvoiced: json["formated_base_grand_total_invoiced"],
    grandTotalRefunded: json["grand_total_refunded"],
    formatedGrandTotalRefunded: json["formated_grand_total_refunded"],
    baseGrandTotalRefunded: json["base_grand_total_refunded"],
    formatedBaseGrandTotalRefunded: json["formated_base_grand_total_refunded"],
    subTotal: json["sub_total"],
    formatedSubTotal: json["formated_sub_total"],
    baseSubTotal: json["base_sub_total"],
    formatedBaseSubTotal: json["formated_base_sub_total"],
    subTotalInvoiced: json["sub_total_invoiced"],
    formatedSubTotalInvoiced: json["formated_sub_total_invoiced"],
    baseSubTotalInvoiced: json["base_sub_total_invoiced"],
    formatedBaseSubTotalInvoiced: json["formated_base_sub_total_invoiced"],
    subTotalRefunded: json["sub_total_refunded"],
    formatedSubTotalRefunded: json["formated_sub_total_refunded"],
    discountPercent: json["discount_percent"],
    discountAmount: json["discount_amount"],
    formatedDiscountAmount: json["formated_discount_amount"],
    baseDiscountAmount: json["base_discount_amount"],
    formatedBaseDiscountAmount: json["formated_base_discount_amount"],
    discountInvoiced: json["discount_invoiced"],
    formatedDiscountInvoiced: json["formated_discount_invoiced"],
    baseDiscountInvoiced: json["base_discount_invoiced"],
    formatedBaseDiscountInvoiced: json["formated_base_discount_invoiced"],
    discountRefunded: json["discount_refunded"],
    formatedDiscountRefunded: json["formated_discount_refunded"],
    baseDiscountRefunded: json["base_discount_refunded"],
    formatedBaseDiscountRefunded: json["formated_base_discount_refunded"],
    taxAmount: json["tax_amount"],
    formatedTaxAmount: json["formated_tax_amount"],
    baseTaxAmount: json["base_tax_amount"],
    formatedBaseTaxAmount: json["formated_base_tax_amount"],
    taxAmountInvoiced: json["tax_amount_invoiced"],
    formatedTaxAmountInvoiced: json["formated_tax_amount_invoiced"],
    baseTaxAmountInvoiced: json["base_tax_amount_invoiced"],
    formatedBaseTaxAmountInvoiced: json["formated_base_tax_amount_invoiced"],
    taxAmountRefunded: json["tax_amount_refunded"],
    formatedTaxAmountRefunded: json["formated_tax_amount_refunded"],
    baseTaxAmountRefunded: json["base_tax_amount_refunded"],
    formatedBaseTaxAmountRefunded: json["formated_base_tax_amount_refunded"],
    shippingAmount: json["shipping_amount"],
    formatedShippingAmount: json["formated_shipping_amount"],
    baseShippingAmount: json["base_shipping_amount"],
    formatedBaseShippingAmount: json["formated_base_shipping_amount"],
    shippingInvoiced: json["shipping_invoiced"],
    formatedShippingInvoiced: json["formated_shipping_invoiced"],
    baseShippingInvoiced: json["base_shipping_invoiced"],
    formatedBaseShippingInvoiced: json["formated_base_shipping_invoiced"],
    shippingRefunded: json["shipping_refunded"],
    formatedShippingRefunded: json["formated_shipping_refunded"],
    baseShippingRefunded: json["base_shipping_refunded"],
    formatedBaseShippingRefunded: json["formated_base_shipping_refunded"],
    customer: Customer.fromJson(json["customer"]),
    channel: Channel.fromJson(json["channel"]),
    shippingAddress: IngAddress.fromJson(json["shipping_address"]),
    billingAddress: IngAddress.fromJson(json["billing_address"]),
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
    invoices: List<dynamic>.from(json["invoices"].map((x) => x)),
    shipments: List<dynamic>.from(json["shipments"].map((x) => x)),
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "increment_id": incrementId,
    "status": status,
    "status_label": statusLabel,
    "channel_name": channelName,
    "is_guest": isGuest,
    "customer_email": customerEmail,
    "customer_first_name": customerFirstName,
    "customer_last_name": customerLastName,
    "shipping_method": shippingMethod,
    "shipping_title": shippingTitle,
    "payment_title": paymentTitle,
    "shipping_description": shippingDescription,
    "coupon_code": couponCode,
    "is_gift": isGift,
    "total_item_count": totalItemCount,
    "total_qty_ordered": totalQtyOrdered,
    "base_currency_code": baseCurrencyCode,
    "channel_currency_code": channelCurrencyCode,
    "order_currency_code": orderCurrencyCode,
    "grand_total": grandTotal,
    "formated_grand_total": formatedGrandTotal,
    "base_grand_total": baseGrandTotal,
    "formated_base_grand_total": formatedBaseGrandTotal,
    "grand_total_invoiced": grandTotalInvoiced,
    "formated_grand_total_invoiced": formatedGrandTotalInvoiced,
    "base_grand_total_invoiced": baseGrandTotalInvoiced,
    "formated_base_grand_total_invoiced": formatedBaseGrandTotalInvoiced,
    "grand_total_refunded": grandTotalRefunded,
    "formated_grand_total_refunded": formatedGrandTotalRefunded,
    "base_grand_total_refunded": baseGrandTotalRefunded,
    "formated_base_grand_total_refunded": formatedBaseGrandTotalRefunded,
    "sub_total": subTotal,
    "formated_sub_total": formatedSubTotal,
    "base_sub_total": baseSubTotal,
    "formated_base_sub_total": formatedBaseSubTotal,
    "sub_total_invoiced": subTotalInvoiced,
    "formated_sub_total_invoiced": formatedSubTotalInvoiced,
    "base_sub_total_invoiced": baseSubTotalInvoiced,
    "formated_base_sub_total_invoiced": formatedBaseSubTotalInvoiced,
    "sub_total_refunded": subTotalRefunded,
    "formated_sub_total_refunded": formatedSubTotalRefunded,
    "discount_percent": discountPercent,
    "discount_amount": discountAmount,
    "formated_discount_amount": formatedDiscountAmount,
    "base_discount_amount": baseDiscountAmount,
    "formated_base_discount_amount": formatedBaseDiscountAmount,
    "discount_invoiced": discountInvoiced,
    "formated_discount_invoiced": formatedDiscountInvoiced,
    "base_discount_invoiced": baseDiscountInvoiced,
    "formated_base_discount_invoiced": formatedBaseDiscountInvoiced,
    "discount_refunded": discountRefunded,
    "formated_discount_refunded": formatedDiscountRefunded,
    "base_discount_refunded": baseDiscountRefunded,
    "formated_base_discount_refunded": formatedBaseDiscountRefunded,
    "tax_amount": taxAmount,
    "formated_tax_amount": formatedTaxAmount,
    "base_tax_amount": baseTaxAmount,
    "formated_base_tax_amount": formatedBaseTaxAmount,
    "tax_amount_invoiced": taxAmountInvoiced,
    "formated_tax_amount_invoiced": formatedTaxAmountInvoiced,
    "base_tax_amount_invoiced": baseTaxAmountInvoiced,
    "formated_base_tax_amount_invoiced": formatedBaseTaxAmountInvoiced,
    "tax_amount_refunded": taxAmountRefunded,
    "formated_tax_amount_refunded": formatedTaxAmountRefunded,
    "base_tax_amount_refunded": baseTaxAmountRefunded,
    "formated_base_tax_amount_refunded": formatedBaseTaxAmountRefunded,
    "shipping_amount": shippingAmount,
    "formated_shipping_amount": formatedShippingAmount,
    "base_shipping_amount": baseShippingAmount,
    "formated_base_shipping_amount": formatedBaseShippingAmount,
    "shipping_invoiced": shippingInvoiced,
    "formated_shipping_invoiced": formatedShippingInvoiced,
    "base_shipping_invoiced": baseShippingInvoiced,
    "formated_base_shipping_invoiced": formatedBaseShippingInvoiced,
    "shipping_refunded": shippingRefunded,
    "formated_shipping_refunded": formatedShippingRefunded,
    "base_shipping_refunded": baseShippingRefunded,
    "formated_base_shipping_refunded": formatedBaseShippingRefunded,
    "customer": customer.toJson(),
    "channel": channel.toJson(),
    "shipping_address": shippingAddress.toJson(),
    "billing_address": billingAddress.toJson(),
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
    "invoices": List<dynamic>.from(invoices.map((x) => x)),
    "shipments": List<dynamic>.from(shipments.map((x) => x)),
    "updated_at": updatedAt.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
  };
}

class IngAddress {
  IngAddress({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.address1,
    this.country,
    this.countryName,
    this.state,
    this.city,
    this.postcode,
    this.phone,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  Email email;
  FirstName firstName;
  LastName lastName;
  List<Address1> address1;
  Country country;
  CountryName countryName;
  State state;
  City city;
  String postcode;
  String phone;
  DateTime createdAt;
  DateTime updatedAt;

  factory IngAddress.fromJson(Map<String, dynamic> json) => IngAddress(
    id: json["id"],
    email: emailValues.map[json["email"]],
    firstName: firstNameValues.map[json["first_name"]],
    lastName: lastNameValues.map[json["last_name"]],
    address1: List<Address1>.from(json["address1"].map((x) => address1Values.map[x])),
    country: countryValues.map[json["country"]],
    countryName: countryNameValues.map[json["country_name"]],
    state: stateValues.map[json["state"]],
    city: cityValues.map[json["city"]],
    postcode: json["postcode"],
    phone: json["phone"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": emailValues.reverse[email],
    "first_name": firstNameValues.reverse[firstName],
    "last_name": lastNameValues.reverse[lastName],
    "address1": List<dynamic>.from(address1.map((x) => address1Values.reverse[x])),
    "country": countryValues.reverse[country],
    "country_name": countryNameValues.reverse[countryName],
    "state": stateValues.reverse[state],
    "city": cityValues.reverse[city],
    "postcode": postcode,
    "phone": phone,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

enum Address1 { SHUWAIKH_INDUSTRY_13007, BSS_APART_BANGLUR }

final address1Values = EnumValues({
  "[\"Bss Apart banglur\"]": Address1.BSS_APART_BANGLUR,
  "Shuwaikh Industry 13007": Address1.SHUWAIKH_INDUSTRY_13007
});

enum City { SALAM, KARNATAKA }

final cityValues = EnumValues({
  "Karnataka": City.KARNATAKA,
  "Salam": City.SALAM
});

enum Country { KW, IN }

final countryValues = EnumValues({
  "IN": Country.IN,
  "KW": Country.KW
});

enum CountryName { EMPTY, COUNTRY_NAME }

final countryNameValues = EnumValues({
  "الهند": CountryName.COUNTRY_NAME,
  "الكويت": CountryName.EMPTY
});

enum Email { AHMAD_BAZARI_COM, HIREN1189_GMAIL_COM }

final emailValues = EnumValues({
  "ahmad@bazari.com": Email.AHMAD_BAZARI_COM,
  "hiren1189@gmail.com": Email.HIREN1189_GMAIL_COM
});

enum FirstName { AHMAD, HIREN }

final firstNameValues = EnumValues({
  "Ahmad": FirstName.AHMAD,
  "Hiren": FirstName.HIREN
});

enum LastName { RAM, PRAJAPATI }

final lastNameValues = EnumValues({
  "Prajapati": LastName.PRAJAPATI,
  "Ram": LastName.RAM
});

enum State { EMPTY, KA }

final stateValues = EnumValues({
  "": State.EMPTY,
  "KA": State.KA
});

class Channel {
  Channel({
    this.id,
    this.code,
    this.name,
    this.description,
    this.timezone,
    this.theme,
    this.homePageContent,
    this.footerContent,
    this.hostname,
    this.logo,
    this.logoUrl,
    this.favicon,
    this.faviconUrl,
    this.defaultLocale,
    this.rootCategoryId,
    this.rootCategory,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String code;
  dynamic name;
  dynamic description;
  dynamic timezone;
  String theme;
  dynamic homePageContent;
  dynamic footerContent;
  String hostname;
  dynamic logo;
  dynamic logoUrl;
  dynamic favicon;
  dynamic faviconUrl;
  DefaultLocale defaultLocale;
  int rootCategoryId;
  Category rootCategory;
  dynamic createdAt;
  DateTime updatedAt;

  factory Channel.fromJson(Map<String, dynamic> json) => Channel(
    id: json["id"],
    code: json["code"],
    name: json["name"],
    description: json["description"],
    timezone: json["timezone"],
    theme: json["theme"],
    homePageContent: json["home_page_content"],
    footerContent: json["footer_content"],
    hostname: json["hostname"],
    logo: json["logo"],
    logoUrl: json["logo_url"],
    favicon: json["favicon"],
    faviconUrl: json["favicon_url"],
    defaultLocale: DefaultLocale.fromJson(json["default_locale"]),
    rootCategoryId: json["root_category_id"],
    rootCategory: Category.fromJson(json["root_category"]),
    createdAt: json["created_at"],
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "code": code,
    "name": name,
    "description": description,
    "timezone": timezone,
    "theme": theme,
    "home_page_content": homePageContent,
    "footer_content": footerContent,
    "hostname": hostname,
    "logo": logo,
    "logo_url": logoUrl,
    "favicon": favicon,
    "favicon_url": faviconUrl,
    "default_locale": defaultLocale.toJson(),
    "root_category_id": rootCategoryId,
    "root_category": rootCategory.toJson(),
    "created_at": createdAt,
    "updated_at": updatedAt.toIso8601String(),
  };
}

class DefaultLocale {
  DefaultLocale({
    this.id,
    this.code,
    this.name,
    this.localeImage,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String code;
  String name;
  String localeImage;
  dynamic createdAt;
  DateTime updatedAt;

  factory DefaultLocale.fromJson(Map<String, dynamic> json) => DefaultLocale(
    id: json["id"],
    code: json["code"],
    name: json["name"],
    localeImage: json["locale_image"],
    createdAt: json["created_at"],
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "code": code,
    "name": name,
    "locale_image": localeImage,
    "created_at": createdAt,
    "updated_at": updatedAt.toIso8601String(),
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
  DisplayMode displayMode;
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
    displayMode: displayModeValues.map[json["display_mode"]],
    description: json["description"] == null ? null : json["description"],
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
    "display_mode": displayModeValues.reverse[displayMode],
    "description": description == null ? null : description,
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

enum DisplayMode { PRODUCTS_AND_DESCRIPTION }

final displayModeValues = EnumValues({
  "products_and_description": DisplayMode.PRODUCTS_AND_DESCRIPTION
});

class Customer {
  Customer({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.name,
    this.gender,
    this.dateOfBirth,
    this.phone,
    this.status,
    this.languageId,
    this.group,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String email;
  String firstName;
  String lastName;
  String name;
  String gender;
  dynamic dateOfBirth;
  dynamic phone;
  int status;
  int languageId;
  Group group;
  DateTime createdAt;
  DateTime updatedAt;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
    id: json["id"],
    email: json["email"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    name: json["name"],
    gender: json["gender"],
    dateOfBirth: json["date_of_birth"],
    phone: json["phone"],
    status: json["status"],
    languageId: json["language_id"],
    group: Group.fromJson(json["group"]),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "first_name": firstName,
    "last_name": lastName,
    "name": name,
    "gender": gender,
    "date_of_birth": dateOfBirth,
    "phone": phone,
    "status": status,
    "language_id": languageId,
    "group": group.toJson(),
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class Group {
  Group({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String name;
  dynamic createdAt;
  dynamic updatedAt;

  factory Group.fromJson(Map<String, dynamic> json) => Group(
    id: json["id"],
    name: json["name"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}

class Item {
  Item({
    this.id,
    this.sku,
    this.type,
    this.name,
    this.product,
    this.couponCode,
    this.weight,
    this.totalWeight,
    this.qtyOrdered,
    this.qtyCanceled,
    this.qtyInvoiced,
    this.qtyShipped,
    this.qtyRefunded,
    this.price,
    this.formatedPrice,
    this.basePrice,
    this.formatedBasePrice,
    this.total,
    this.formatedTotal,
    this.baseTotal,
    this.formatedBaseTotal,
    this.totalInvoiced,
    this.formatedTotalInvoiced,
    this.baseTotalInvoiced,
    this.formatedBaseTotalInvoiced,
    this.amountRefunded,
    this.formatedAmountRefunded,
    this.baseAmountRefunded,
    this.formatedBaseAmountRefunded,
    this.discountPercent,
    this.discountAmount,
    this.formatedDiscountAmount,
    this.baseDiscountAmount,
    this.formatedBaseDiscountAmount,
    this.discountInvoiced,
    this.formatedDiscountInvoiced,
    this.baseDiscountInvoiced,
    this.formatedBaseDiscountInvoiced,
    this.discountRefunded,
    this.formatedDiscountRefunded,
    this.baseDiscountRefunded,
    this.formatedBaseDiscountRefunded,
    this.taxPercent,
    this.taxAmount,
    this.formatedTaxAmount,
    this.baseTaxAmount,
    this.formatedBaseTaxAmount,
    this.taxAmountInvoiced,
    this.formatedTaxAmountInvoiced,
    this.baseTaxAmountInvoiced,
    this.formatedBaseTaxAmountInvoiced,
    this.taxAmountRefunded,
    this.formatedTaxAmountRefunded,
    this.baseTaxAmountRefunded,
    this.formatedBaseTaxAmountRefunded,
    this.grantTotal,
    this.formatedGrantTotal,
    this.baseGrantTotal,
    this.formatedBaseGrantTotal,
    this.downloadableLinks,
    this.additional,
    this.child,
    this.children,
  });

  int id;
  String sku;
  String type;
  String name;
  Product product;
  dynamic couponCode;
  String weight;
  String totalWeight;
  int qtyOrdered;
  int qtyCanceled;
  int qtyInvoiced;
  int qtyShipped;
  int qtyRefunded;
  String price;
  String formatedPrice;
  String basePrice;
  String formatedBasePrice;
  String total;
  String formatedTotal;
  String baseTotal;
  String formatedBaseTotal;
  String totalInvoiced;
  String formatedTotalInvoiced;
  String baseTotalInvoiced;
  String formatedBaseTotalInvoiced;
  String amountRefunded;
  String formatedAmountRefunded;
  String baseAmountRefunded;
  String formatedBaseAmountRefunded;
  String discountPercent;
  String discountAmount;
  String formatedDiscountAmount;
  String baseDiscountAmount;
  String formatedBaseDiscountAmount;
  String discountInvoiced;
  String formatedDiscountInvoiced;
  String baseDiscountInvoiced;
  String formatedBaseDiscountInvoiced;
  String discountRefunded;
  String formatedDiscountRefunded;
  String baseDiscountRefunded;
  String formatedBaseDiscountRefunded;
  String taxPercent;
  String taxAmount;
  String formatedTaxAmount;
  String baseTaxAmount;
  String formatedBaseTaxAmount;
  String taxAmountInvoiced;
  String formatedTaxAmountInvoiced;
  String baseTaxAmountInvoiced;
  String formatedBaseTaxAmountInvoiced;
  String taxAmountRefunded;
  String formatedTaxAmountRefunded;
  String baseTaxAmountRefunded;
  String formatedBaseTaxAmountRefunded;
  double grantTotal;
  String formatedGrantTotal;
  double baseGrantTotal;
  String formatedBaseGrantTotal;
  List<dynamic> downloadableLinks;
  Additional additional;
  dynamic child;
  List<dynamic> children;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json["id"],
    sku: json["sku"],
    type: json["type"],
    name: json["name"],
    product: Product.fromJson(json["product"]),
    couponCode: json["coupon_code"],
    weight: json["weight"],
    totalWeight: json["total_weight"],
    qtyOrdered: json["qty_ordered"],
    qtyCanceled: json["qty_canceled"],
    qtyInvoiced: json["qty_invoiced"],
    qtyShipped: json["qty_shipped"],
    qtyRefunded: json["qty_refunded"],
    price: json["price"],
    formatedPrice: json["formated_price"],
    basePrice: json["base_price"],
    formatedBasePrice: json["formated_base_price"],
    total: json["total"],
    formatedTotal: json["formated_total"],
    baseTotal: json["base_total"],
    formatedBaseTotal: json["formated_base_total"],
    totalInvoiced: json["total_invoiced"],
    formatedTotalInvoiced: json["formated_total_invoiced"],
    baseTotalInvoiced: json["base_total_invoiced"],
    formatedBaseTotalInvoiced: json["formated_base_total_invoiced"],
    amountRefunded: json["amount_refunded"],
    formatedAmountRefunded: json["formated_amount_refunded"],
    baseAmountRefunded: json["base_amount_refunded"],
    formatedBaseAmountRefunded: json["formated_base_amount_refunded"],
    discountPercent: json["discount_percent"],
    discountAmount: json["discount_amount"],
    formatedDiscountAmount: json["formated_discount_amount"],
    baseDiscountAmount: json["base_discount_amount"],
    formatedBaseDiscountAmount: json["formated_base_discount_amount"],
    discountInvoiced: json["discount_invoiced"],
    formatedDiscountInvoiced: json["formated_discount_invoiced"],
    baseDiscountInvoiced: json["base_discount_invoiced"],
    formatedBaseDiscountInvoiced: json["formated_base_discount_invoiced"],
    discountRefunded: json["discount_refunded"],
    formatedDiscountRefunded: json["formated_discount_refunded"],
    baseDiscountRefunded: json["base_discount_refunded"],
    formatedBaseDiscountRefunded: json["formated_base_discount_refunded"],
    taxPercent: json["tax_percent"],
    taxAmount: json["tax_amount"],
    formatedTaxAmount: json["formated_tax_amount"],
    baseTaxAmount: json["base_tax_amount"],
    formatedBaseTaxAmount: json["formated_base_tax_amount"],
    taxAmountInvoiced: json["tax_amount_invoiced"],
    formatedTaxAmountInvoiced: json["formated_tax_amount_invoiced"],
    baseTaxAmountInvoiced: json["base_tax_amount_invoiced"],
    formatedBaseTaxAmountInvoiced: json["formated_base_tax_amount_invoiced"],
    taxAmountRefunded: json["tax_amount_refunded"],
    formatedTaxAmountRefunded: json["formated_tax_amount_refunded"],
    baseTaxAmountRefunded: json["base_tax_amount_refunded"],
    formatedBaseTaxAmountRefunded: json["formated_base_tax_amount_refunded"],
    grantTotal: json["grant_total"].toDouble(),
    formatedGrantTotal: json["formated_grant_total"],
    baseGrantTotal: json["base_grant_total"].toDouble(),
    formatedBaseGrantTotal: json["formated_base_grant_total"],
    downloadableLinks: List<dynamic>.from(json["downloadable_links"].map((x) => x)),
    additional: Additional.fromJson(json["additional"]),
    child: json["child"],
    children: List<dynamic>.from(json["children"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "sku": sku,
    "type": type,
    "name": name,
    "product": product.toJson(),
    "coupon_code": couponCode,
    "weight": weight,
    "total_weight": totalWeight,
    "qty_ordered": qtyOrdered,
    "qty_canceled": qtyCanceled,
    "qty_invoiced": qtyInvoiced,
    "qty_shipped": qtyShipped,
    "qty_refunded": qtyRefunded,
    "price": price,
    "formated_price": formatedPrice,
    "base_price": basePrice,
    "formated_base_price": formatedBasePrice,
    "total": total,
    "formated_total": formatedTotal,
    "base_total": baseTotal,
    "formated_base_total": formatedBaseTotal,
    "total_invoiced": totalInvoiced,
    "formated_total_invoiced": formatedTotalInvoiced,
    "base_total_invoiced": baseTotalInvoiced,
    "formated_base_total_invoiced": formatedBaseTotalInvoiced,
    "amount_refunded": amountRefunded,
    "formated_amount_refunded": formatedAmountRefunded,
    "base_amount_refunded": baseAmountRefunded,
    "formated_base_amount_refunded": formatedBaseAmountRefunded,
    "discount_percent": discountPercent,
    "discount_amount": discountAmount,
    "formated_discount_amount": formatedDiscountAmount,
    "base_discount_amount": baseDiscountAmount,
    "formated_base_discount_amount": formatedBaseDiscountAmount,
    "discount_invoiced": discountInvoiced,
    "formated_discount_invoiced": formatedDiscountInvoiced,
    "base_discount_invoiced": baseDiscountInvoiced,
    "formated_base_discount_invoiced": formatedBaseDiscountInvoiced,
    "discount_refunded": discountRefunded,
    "formated_discount_refunded": formatedDiscountRefunded,
    "base_discount_refunded": baseDiscountRefunded,
    "formated_base_discount_refunded": formatedBaseDiscountRefunded,
    "tax_percent": taxPercent,
    "tax_amount": taxAmount,
    "formated_tax_amount": formatedTaxAmount,
    "base_tax_amount": baseTaxAmount,
    "formated_base_tax_amount": formatedBaseTaxAmount,
    "tax_amount_invoiced": taxAmountInvoiced,
    "formated_tax_amount_invoiced": formatedTaxAmountInvoiced,
    "base_tax_amount_invoiced": baseTaxAmountInvoiced,
    "formated_base_tax_amount_invoiced": formatedBaseTaxAmountInvoiced,
    "tax_amount_refunded": taxAmountRefunded,
    "formated_tax_amount_refunded": formatedTaxAmountRefunded,
    "base_tax_amount_refunded": baseTaxAmountRefunded,
    "formated_base_tax_amount_refunded": formatedBaseTaxAmountRefunded,
    "grant_total": grantTotal,
    "formated_grant_total": formatedGrantTotal,
    "base_grant_total": baseGrantTotal,
    "formated_base_grant_total": formatedBaseGrantTotal,
    "downloadable_links": List<dynamic>.from(downloadableLinks.map((x) => x)),
    "additional": additional.toJson(),
    "child": child,
    "children": List<dynamic>.from(children.map((x) => x)),
  };
}

class Additional {
  Additional({
    this.token,
    this.locale,
    this.quantity,
    this.productId,
  });

  String token;
  String locale;
  String quantity;
  String productId;

  factory Additional.fromJson(Map<String, dynamic> json) => Additional(
    token: json["token"],
    locale: json["locale"],
    quantity: json["quantity"],
    productId: json["product_id"],
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "locale": locale,
    "quantity": quantity,
    "product_id": productId,
  };
}

class Product {
  Product({
    this.id,
    this.sku,
    this.type,
    this.name,
    this.urlKey,
    this.price,
    this.specialPrice,
    this.savingPrice,
    this.shortDescription,
    this.description,
    this.category,
    this.images,
    this.baseImage,
    this.brand,
    this.color,
    this.createdAt,
    this.updatedAt,
    this.reviews,
    this.inStock,
    this.isSaved,
    this.isWishlisted,
    this.isItemInCart,
    this.showQuantityChanger,
    this.parentId,
    this.size,
    this.quantity,
  });

  int id;
  String sku;
  String type;
  String name;
  String urlKey;
  String price;
  String specialPrice;
  String savingPrice;
  String shortDescription;
  String description;
  List<Category> category;
  List<Image> images;
  BaseImage baseImage;
  Brand brand;
  Brand color;
  DateTime createdAt;
  DateTime updatedAt;
  Reviews reviews;
  bool inStock;
  bool isSaved;
  bool isWishlisted;
  bool isItemInCart;
  bool showQuantityChanger;
  int parentId;
  Size size;
  int quantity;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    sku: json["sku"],
    type: json["type"],
    name: json["name"],
    urlKey: json["url_key"],
    price: json["price"],
    specialPrice: json["special_price"],
    savingPrice: json["saving_price"],
    shortDescription: json["short_description"],
    description: json["description"],
    category: json["category"] == null ? null : List<Category>.from(json["category"].map((x) => Category.fromJson(x))),
    images: json["images"] == null ? null : List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
    baseImage: json["base_image"] == null ? null : BaseImage.fromJson(json["base_image"]),
    brand: json["brand"] == null ? null : Brand.fromJson(json["brand"]),
    color: json["color"] == null ? null : Brand.fromJson(json["color"]),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    reviews: json["reviews"] == null ? null : Reviews.fromJson(json["reviews"]),
    inStock: json["in_stock"] == null ? null : json["in_stock"],
    isSaved: json["is_saved"] == null ? null : json["is_saved"],
    isWishlisted: json["is_wishlisted"] == null ? null : json["is_wishlisted"],
    isItemInCart: json["is_item_in_cart"] == null ? null : json["is_item_in_cart"],
    showQuantityChanger: json["show_quantity_changer"] == null ? null : json["show_quantity_changer"],
    parentId: json["parent_id"] == null ? null : json["parent_id"],
    size: json["size"] == null ? null : Size.fromJson(json["size"]),
    quantity: json["quantity"] == null ? null : json["quantity"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "sku": sku,
    "type": type,
    "name": name,
    "url_key": urlKey,
    "price": price,
    "special_price": specialPrice,
    "saving_price": savingPrice,
    "short_description": shortDescription,
    "description": description,
    "category": category == null ? null : List<dynamic>.from(category.map((x) => x.toJson())),
    "images": images == null ? null : List<dynamic>.from(images.map((x) => x.toJson())),
    "base_image": baseImage == null ? null : baseImage.toJson(),
    "brand": brand == null ? null : brand.toJson(),
    "color": color == null ? null : color.toJson(),
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "reviews": reviews == null ? null : reviews.toJson(),
    "in_stock": inStock == null ? null : inStock,
    "is_saved": isSaved == null ? null : isSaved,
    "is_wishlisted": isWishlisted == null ? null : isWishlisted,
    "is_item_in_cart": isItemInCart == null ? null : isItemInCart,
    "show_quantity_changer": showQuantityChanger == null ? null : showQuantityChanger,
    "parent_id": parentId == null ? null : parentId,
    "size": size == null ? null : size.toJson(),
    "quantity": quantity == null ? null : quantity,
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

class Brand {
  Brand({
    this.id,
    this.label,
    this.swatchValue,
  });

  int id;
  Label label;
  String swatchValue;

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
    id: json["id"] == null ? null : json["id"],
    label: json["label"] == null ? null : labelValues.map[json["label"]],
    swatchValue: json["swatch_value"] == null ? null : json["swatch_value"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "label": label == null ? null : labelValues.reverse[label],
    "swatch_value": swatchValue == null ? null : swatchValue,
  };
}

enum Label { HERBAL_SCIENCE, PROCSIN, NO_COLOR }

final labelValues = EnumValues({
  "Herbal Science": Label.HERBAL_SCIENCE,
  "No Color": Label.NO_COLOR,
  "Procsin": Label.PROCSIN
});

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
  });

  dynamic total;
  dynamic totalRating;
  dynamic averageRating;

  factory Reviews.fromJson(Map<String, dynamic> json) => Reviews(
    total: json["total"],
    totalRating: json["total_rating"],
    averageRating: json["average_rating"],
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "total_rating": totalRating,
    "average_rating": averageRating,
  };
}

class Size {
  Size({
    this.id,
    this.label,
  });

  int id;
  String label;

  factory Size.fromJson(Map<String, dynamic> json) => Size(
    id: json["id"],
    label: json["label"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "label": label,
  };
}

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
