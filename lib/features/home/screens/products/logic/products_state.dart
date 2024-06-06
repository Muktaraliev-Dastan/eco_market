part of 'products_bloc.dart';

@immutable
sealed class ProductsState {}

class ProductsInitialState extends ProductsState {}

class ProductsLoadingState extends ProductsState {}

class ProductsLoadedState extends ProductsState {
  final List<ProductModel> products;

  ProductsLoadedState({required this.products});
}

class ProductsErrorState extends ProductsState {
  final CatchException error;

  ProductsErrorState({required this.error});
}

