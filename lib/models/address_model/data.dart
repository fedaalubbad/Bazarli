class Address {
  int id;
  String firstName;
  String lastName;
  Null companyName;
  List<String> address1;
  String country;
  String countryName;
  String state;
  String city;
  String postcode;
  String phone;
  String createdAt;
  String updatedAt;

  Address(
      {this.id,
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
        this.updatedAt});

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    companyName = json['company_name'];
    address1 = json['address1'].cast<String>();
    country = json['country'];
    countryName = json['country_name'];
    state = json['state'];
    city = json['city'];
    postcode = json['postcode'];
    phone = json['phone'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['company_name'] = this.companyName;
    data['address1'] = this.address1;
    data['country'] = this.country;
    data['country_name'] = this.countryName;
    data['state'] = this.state;
    data['city'] = this.city;
    data['postcode'] = this.postcode;
    data['phone'] = this.phone;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}