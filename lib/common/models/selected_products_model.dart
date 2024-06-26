import 'package:eco_market/common/models/product_model.dart';

class SelectedProductsModel {
  final ProductModel productModel;
  final int quantity;

  SelectedProductsModel({
    required this.productModel,
    required this.quantity,
  });
}
