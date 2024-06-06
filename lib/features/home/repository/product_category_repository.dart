import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:eco_market/common/helpers/api_requester.dart';
import 'package:eco_market/common/helpers/catch_exception.dart';
import 'package:eco_market/common/models/product_category_model.dart';

class ProductCategoryRepository {
  ApiRequester apiRequester = ApiRequester();

  Future<List<ProductCategoryModel>> getAllProductCategories() async {
    try {
      Response response = await apiRequester.toGet('/product-category-list/');
      if (response.statusCode == 200) {
        List categories = response.data??[];
        return List<ProductCategoryModel>.from(
          categories.map(
            (element) => ProductCategoryModel.fromJson(element),
          ),
        );
      }
      throw response;
    } catch (error) {
      log('ERROR PRODUCTCATEGORYMODEL GETTING');
      throw CatchException.convertException(error);
    }
  }
}
