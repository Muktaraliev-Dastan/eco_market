part of 'products_bloc.dart';

@immutable
sealed class ProductsEvent {}

class GetAllProductsEvent extends ProductsEvent{}

class GetProductsByCategoryEvent extends ProductsEvent{
  final String categoryName;

  GetProductsByCategoryEvent({required this.categoryName});
}

