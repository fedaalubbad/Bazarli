class Additional {
  int quantity;
  int productId;

  Additional({this.quantity, this.productId});

  Additional.fromJson(Map<String, dynamic> json) {
    quantity = json['quantity'];
    productId = json['product_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['quantity'] = this.quantity;
    data['product_id'] = this.productId;
    return data;
  }
}