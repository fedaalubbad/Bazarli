import 'group.dart';

class SupplierData {
  int id;
  String email;
  String name;
  int status;
  int roleId;
  String createdAt;
  String updatedAt;

  SupplierData(
      {this.id,
        this.email,
        this.name,
        this.status,
        this.roleId,
        this.createdAt,
        this.updatedAt});

  SupplierData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    name = json['name'];
    status = json['status'];
    roleId = json['role_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['name'] = this.name;
    data['status'] = this.status;
    data['role_id'] = this.roleId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}