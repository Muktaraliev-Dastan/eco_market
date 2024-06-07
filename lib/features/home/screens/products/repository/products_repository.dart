import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:eco_market/common/helpers/api_requester.dart';
import 'package:eco_market/common/helpers/catch_exception.dart';
import 'package:eco_market/common/models/product_model.dart';

class ProductsRepository {
  ApiRequester apiRequester = ApiRequester();

  Future<List<ProductModel>> getAllProducts() async {
    try {
      Response response = await apiRequester.toGet('/product-list/');
      if (response.statusCode == 200) {
        List categories = response.data ?? [];
        return List<ProductModel>.from(
          categories.map(
            (element) => ProductModel.fromJson(element),
          ),
        );
      }
      throw response;
    } catch (error) {
      log('ERROR PRODUCTMODEL GETTING1');
      throw CatchException.convertException(error);
    }
  }

  Future<List<ProductModel>> getProductsByCategory(
      String categoryName) async {
    try {
      Response response = await apiRequester.toGet('/product-list/', {
        'category_name': categoryName
      });
      if (response.statusCode == 200) {
        List categories = response.data ?? [];
        return List<ProductModel>.from(
          categories.map(
            (element) => ProductModel.fromJson(element),
          ),
        );
      }
      throw response;
    } catch (error) {
      log('ERROR PRODUCTMODEL GETTING2');
      throw CatchException.convertException(error);
    }
  }

  Future<List<ProductModel>> getProductsSearch(
      String search) async {
    try {
      Response response = await apiRequester.toGet('/product-list/', {
        'search': search,
      });
      if (response.statusCode == 200) {
        List categories = response.data ?? [];
        return List<ProductModel>.from(
          categories.map(
            (element) => ProductModel.fromJson(element),
          ),
        );
      }
      throw response;
    } catch (error) {
      log('ERROR PRODUCTMODEL GETTING3');
      throw CatchException.convertException(error);
    }
  }
}
