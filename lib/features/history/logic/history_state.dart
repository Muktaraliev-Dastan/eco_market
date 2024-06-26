part of 'history_bloc.dart';

@immutable
sealed class HistoryState {}

class HistoryInitialState extends HistoryState {}

class HistoryLoadingState extends HistoryState {}

class HistoryLoadedState extends HistoryState {
  final List<OrderModel> orders;

  HistoryLoadedState({required this.orders});
}

class HistoryErrorState extends HistoryState {
  final CatchException error;

  HistoryErrorState({required this.error});
}


