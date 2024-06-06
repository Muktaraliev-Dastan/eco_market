import 'package:bloc/bloc.dart';
import 'package:eco_market/common/helpers/catch_exception.dart';
import 'package:eco_market/common/models/product_model.dart';
import 'package:eco_market/features/home/screens/products/repository/products_repository.dart';
import 'package:meta/meta.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductsRepository productsRepository;

  ProductsBloc(this.productsRepository) : super(ProductsInitialState()) {
    on<GetAllProductsEvent>((event, emit) async {
      emit(ProductsLoadingState());
      try{
        List<ProductModel> products =
            await productsRepository.getAllProducts();
        emit(ProductsLoadedState(products:products));
      }catch(error){
        emit(
          ProductsErrorState(
            error: CatchException.convertException(error),
          ),
        );
      }

    });
    on<GetProductsByCategoryEvent>((event, emit) async {
      emit(ProductsLoadingState());
      try{
        List<ProductModel> products =
        await productsRepository.getProductsByCategory(event.categoryName);
        emit(ProductsLoadedState(products:products));
      }catch(error){
        emit(
          ProductsErrorState(
            error: CatchException.convertException(error),
          ),
        );
      }

    });
  }
}
