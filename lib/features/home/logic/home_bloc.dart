import 'package:bloc/bloc.dart';
import 'package:eco_market/common/helpers/catch_exception.dart';
import 'package:eco_market/common/models/product_category_model.dart';
import 'package:eco_market/features/home/repository/product_category_repository.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ProductCategoryRepository productCategoryRepository;

  HomeBloc(this.productCategoryRepository) : super(HomeInitialState()) {
    on<GetAllProductsCategoryEvent>((event, emit) async {
      emit(HomeLoadingState());
      try {
        List<ProductCategoryModel> productCategories =
            await productCategoryRepository.getAllProductCategories();
        emit(HomeLoadedState(productCategories: productCategories));
      } catch (error) {
        emit(
          HomeErrorState(
            error: CatchException.convertException(error),
          ),
        );
      }
    });
  }
}
