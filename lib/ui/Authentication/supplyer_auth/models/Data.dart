class Data {
   int id;
  String name;
  String email;
   int status;
   int roleId;
  String createdAt;
  String updatedAt;

  Data({this.id,
        this.name,
        this.email,
        this.status,
        this.roleId,
        this.createdAt,
        this.updatedAt
  });

  Data.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.name = json['name'];
    this.email = json['email'];
    this.status = json['status'];
    this.roleId = json['role_id'];
    this.createdAt = json['created_at'];
    this.updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['status'] = this.status;
    data['role_id'] = this.roleId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}