import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:eco_market/common/helpers/api_requester.dart';
import 'package:eco_market/common/helpers/catch_exception.dart';
import 'package:eco_market/common/models/order_model.dart';

class HistoryRepository {
  ApiRequester apiRequester = ApiRequester();

  Future<List<OrderModel>> getAllOrders() async {
    Response response = await apiRequester.toGet('/order-list/');
    try {
      if (response.statusCode == 200) {
        List orders = response.data ?? [];
        return List<OrderModel>.from(
          orders.map(
            (e) => OrderModel.fromJson(e),
          ),
        );
      }
      throw response;
    } catch (error) {
      log('ERROR HISTORY GETTING');
      throw CatchException.convertException(error);
    }
  }
}
