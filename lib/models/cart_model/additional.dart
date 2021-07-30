class Additional {
  Additional({
    this.quantity,
    this.productId,
  });

  String quantity;
  String productId;

  factory Additional.fromJson(Map<String, dynamic> json) => Additional(
    quantity: json["quantity"],
    productId: json["product_id"],
  );

  Map<String, dynamic> toJson() => {
    "quantity": quantity,
    "product_id": productId,
  };
}