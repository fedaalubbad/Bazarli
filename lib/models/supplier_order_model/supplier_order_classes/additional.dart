class Additional {
  String sToken;
  String locale;
  int quantity;
  String productId;

  Additional({this.sToken, this.locale, this.quantity, this.productId});

  Additional.fromJson(Map<String, dynamic> json) {
    sToken = json['_token'];
    locale = json['locale'];
    quantity = json['quantity'];
    productId = json['product_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_token'] = this.sToken;
    data['locale'] = this.locale;
    data['quantity'] = this.quantity;
    data['product_id'] = this.productId;
    return data;
  }
}