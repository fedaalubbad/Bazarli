class IngAddress {
  IngAddress({
    this.id,
    this.firstName,
    this.lastName,
    this.name,
    this.email,
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
  String name;
  String email;
  List<String> address1;
  String country;
  String countryName;
  String state;
  String city;
  String postcode;
  String phone;
  DateTime createdAt;
  DateTime updatedAt;

  factory IngAddress.fromJson(Map<String, dynamic> json) => IngAddress(
    id: json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    name: json["name"],
    email: json["email"],
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
    "name": name,
    "email": email,
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
