part of 'order_bloc.dart';

@immutable
sealed class OrderEvent {}

class PostOrderEvent extends OrderEvent {
  final OrderModel orderModel;

  PostOrderEvent({required this.orderModel});
}

class AddProductsToOrderEvent extends OrderEvent {
  final SelectedProductsModel selectedProductsModel;

  AddProductsToOrderEvent({
    required this.selectedProductsModel,
  });
}

class DeleteAllSelectedProducts extends OrderEvent{}
