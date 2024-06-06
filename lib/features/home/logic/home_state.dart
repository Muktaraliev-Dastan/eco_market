part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedState extends HomeState {
  final List<ProductCategoryModel> productCategories;

  HomeLoadedState({required this.productCategories});
}

class HomeErrorState extends HomeState {
  final CatchException error;

  HomeErrorState({required this.error});
}



