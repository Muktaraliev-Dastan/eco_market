import 'package:bloc/bloc.dart';
import 'package:eco_market/common/helpers/catch_exception.dart';
import 'package:eco_market/common/models/order_model.dart';
import 'package:eco_market/features/history/repository/history_repository.dart';
import 'package:meta/meta.dart';

part 'history_event.dart';

part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final HistoryRepository historyRepository;
  HistoryBloc(this.historyRepository) : super(HistoryInitialState()) {
    on<GetAllOrders>((event, emit) async {
      emit(HistoryLoadingState());
      try {
        List<OrderModel> orders=await historyRepository.getAllOrders();
        emit(HistoryLoadedState(orders: orders));
      } catch (error) {
        emit(
          HistoryErrorState(error: CatchException.convertException(error)),
        );
      }
    });
  }
}
