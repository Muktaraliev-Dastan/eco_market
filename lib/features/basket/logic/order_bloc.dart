import 'package:bloc/bloc.dart';
import 'package:eco_market/common/helpers/catch_exception.dart';
import 'package:eco_market/common/models/order_model.dart';
import 'package:eco_market/common/models/selected_products_model.dart';
import 'package:eco_market/features/basket/repository/order_repository.dart';
import 'package:meta/meta.dart';

part 'order_event.dart';

part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final OrderRepository orderRepository;

  OrderBloc(this.orderRepository) : super(OrderInitialState()) {
    on<PostOrderEvent>((event, emit) {
      emit(OrderLoadingState());
      try {
        orderRepository.createOrder(event.orderModel);
        emit(OrderLoadedState(selectedProducts: []));
      } catch (error) {
        emit(
          OrderErrorState(
            error: CatchException.convertException(error),
          ),
        );
      }
    });

    on<AddProductsToOrderEvent>((event, emit) {
      emit(OrderLoadingState());
      try {
        orderRepository.selectedProducts.add(event.selectedProductsModel);
        orderRepository.totalPrice += event.selectedProductsModel.quantity *
            double.parse(event.selectedProductsModel.productModel.price!);
        emit(
          OrderLoadedState(
            selectedProducts: orderRepository.selectedProducts,
            totalPrice: orderRepository.totalPrice,
          ),
        );
      } catch (error) {
        emit(
          OrderErrorState(
            error: CatchException.convertException(error),
          ),
        );
      }
    });

    on<DeleteAllSelectedProducts>((event, emit) {
      emit(OrderLoadingState());
      try {
        orderRepository.selectedProducts=[];
        orderRepository.totalPrice=0;
        emit(
          OrderLoadedState(
            selectedProducts: orderRepository.selectedProducts,
            totalPrice: orderRepository.totalPrice,
          ),
        );
      } catch (error) {
        emit(
          OrderErrorState(
            error: CatchException.convertException(error),
          ),
        );
      }
    });

  }
}
