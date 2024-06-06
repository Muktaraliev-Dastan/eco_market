class OrderItemModel {
  int? product;
  int? quantity;

  OrderItemModel({this.product, this.quantity});

  OrderItemModel.fromJson(Map<String, dynamic> json) {
    product = json['product'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product'] = this.product;
    data['quantity'] = this.quantity;
    return data;
  }
}