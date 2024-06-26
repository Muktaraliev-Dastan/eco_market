part of 'order_bloc.dart';

@immutable
sealed class OrderState {}

class OrderInitialState extends OrderState {}

class OrderLoadingState extends OrderState {}

class OrderLoadedState extends OrderState {
  final List<SelectedProductsModel> selectedProducts;
  final double? totalPrice;

  OrderLoadedState({
    this.totalPrice,
    required this.selectedProducts,
  });
}

class OrderErrorState extends OrderState {
  final CatchException error;

  OrderErrorState({required this.error});
}
