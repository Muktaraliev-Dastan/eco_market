import 'dart:developer';

import 'package:eco_market/common/helpers/api_requester.dart';
import 'package:eco_market/common/helpers/catch_exception.dart';
import 'package:eco_market/common/models/order_model.dart';
import 'package:eco_market/common/models/selected_products_model.dart';

class OrderRepository {
  ApiRequester apiRequester = ApiRequester();

  Future createOrder(OrderModel order) async {
    try {
      final response =
          await apiRequester.toPost('/order-create/', {'data': order.toJson()});

      if (response.statusCode == 200) {
        log('Order created successfully: ${response.data}');
      } else {
        log('Failed to create order: ${response.statusCode}');
      }
    } catch (error) {
      log('ERROR CREATEORDER');
      throw CatchException.convertException(error);
    }
  }

  List<SelectedProductsModel> selectedProducts=[];
  double totalPrice=0;
}
