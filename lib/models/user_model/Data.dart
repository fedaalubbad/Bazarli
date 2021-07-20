import 'group.dart';

class Data {
  int id;
  String email;
  String firstName;
  String lastName;
  String name;
  Null gender;
  Null dateOfBirth;
  Null phone;
  int status;
  Group group;
  String createdAt;
  String updatedAt;

  Data(
      {this.id,
        this.email,
        this.firstName,
        this.lastName,
        this.name,
        this.gender,
        this.dateOfBirth,
        this.phone,
        this.status,
        this.group,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    name = json['name'];
    gender = json['gender'];
    dateOfBirth = json['date_of_birth'];
    phone = json['phone'];
    status = json['status'];
    group = json['group'] != null ? new Group.fromJson(json['group']) : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['name'] = this.name;
    data['gender'] = this.gender;
    data['date_of_birth'] = this.dateOfBirth;
    data['phone'] = this.phone;
    data['status'] = this.status;
    if (this.group != null) {
      data['group'] = this.group.toJson();
    }
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}