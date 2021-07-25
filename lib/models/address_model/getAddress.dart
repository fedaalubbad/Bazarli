import 'dart:convert';

GetAddress getAddressFromJson(String str) => GetAddress.fromJson(json.decode(str));

String getAddressToJson(GetAddress data) => json.encode(data.toJson());

class GetAddress {
  GetAddress({
    this.data,
  });

  List<Datum> data;

  factory GetAddress.fromJson(Map<String, dynamic> json) => GetAddress(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.id,
    this.firstName,
    this.lastName,
    this.companyName,
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
  String firstName;
  String lastName;
  dynamic companyName;
  List<String> address1;
  String country;
  String countryName;
  String state;
  String city;
  String postcode;
  String phone;
  DateTime createdAt;
  DateTime updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    companyName: json["company_name"] == null ? null : json["company_name"],
    address1: List<String>.from(json["address1"].map((x) => x)),
    country: json["country"],
    countryName: json["country_name"],
    state: json["state"],
    city: json["city"],
    postcode: json["postcode"],
    phone: json["phone"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "company_name": companyName,
    "address1": List<dynamic>.from(address1.map((x) => x)),
    "country": country,
    "country_name": countryName,
    "state": state,
    "city": city,
    "postcode": postcode,
    "phone": phone,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
