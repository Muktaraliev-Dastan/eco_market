import 'package:eco_market/common/models/order_item_model.dart';

class OrderModel {
  int? orderNumber;
  String? phoneNumber;
  String? address;
  String? referencePoint;
  String? comments;
  String? totalAmount;
  String? createdAt;
  int? deliveryCost;
  List<OrderItemModel>? orderedProducts;

  OrderModel(
      {this.orderNumber,
        this.phoneNumber,
        this.address,
        this.referencePoint,
        this.comments,
        this.totalAmount,
        this.createdAt,
        this.deliveryCost,
        this.orderedProducts});

  OrderModel.fromJson(Map<String, dynamic> json) {
    orderNumber = json['order_number'];
    phoneNumber = json['phone_number'];
    address = json['address'];
    referencePoint = json['reference_point'];
    comments = json['comments'];
    totalAmount = json['total_amount'];
    createdAt = json['created_at'];
    deliveryCost = json['delivery_cost'];
    if (json['ordered_products'] != null) {
      orderedProducts = <OrderItemModel>[];
      json['ordered_products'].forEach((v) {
        orderedProducts!.add(new OrderItemModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['order_number'] = this.orderNumber;
    data['phone_number'] = this.phoneNumber;
    data['address'] = this.address;
    data['reference_point'] = this.referencePoint;
    data['comments'] = this.comments;
    data['total_amount'] = this.totalAmount;
    data['created_at'] = this.createdAt;
    data['delivery_cost'] = this.deliveryCost;
    if (this.orderedProducts != null) {
      data['ordered_products'] =
          this.orderedProducts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


