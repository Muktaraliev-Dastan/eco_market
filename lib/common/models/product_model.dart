class ProductModel {
  int? id;
  String? title;
  String? description;
  int? category;
  String? image;
  int? quantity;
  String? price;

  ProductModel({
    this.id,
    this.title,
    this.description,
    this.category,
    this.image,
    this.quantity,
    this.price,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    category = json['category'];
    image = json['image'];
    quantity = json['quantity'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['category'] = this.category;
    data['image'] = this.image;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    return data;
  }
}
