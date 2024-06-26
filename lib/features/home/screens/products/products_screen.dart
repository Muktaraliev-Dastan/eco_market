import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:eco_market/common/models/product_category_model.dart';
import 'package:eco_market/common/utils/constants.dart';
import 'package:eco_market/features/basket/logic/order_bloc.dart';
import 'package:eco_market/features/home/screens/products/logic/products_bloc.dart';
import 'package:eco_market/features/home/screens/products/repository/products_repository.dart';
import 'package:eco_market/features/home/widgets/custom_grid_view.dart';
import 'package:eco_market/features/home/widgets/search_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


@RoutePage()
class ProductsScreen extends StatefulWidget {
  final int tabIndex;
  final String categoryName;
  final List<ProductCategoryModel> productCategories;

  const ProductsScreen({
    super.key,
    required this.categoryName,
    required this.productCategories,
    required this.tabIndex,
  });

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen>
    with SingleTickerProviderStateMixin {
  late ProductsBloc productsBloc;
  late TabController _tabController;

  @override
  void initState() {
    productsBloc = ProductsBloc(ProductsRepository());
    productsBloc.add(
      GetProductsByCategoryEvent(categoryName: widget.categoryName),
    );
    _tabController = TabController(
      length: widget.productCategories.length + 1,
      vsync: this,
      initialIndex: widget.tabIndex,
    );
    super.initState();
  }


  @override
  void dispose() {
    productsBloc.close();
    _tabController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    List<String> categories = List.from(
      widget.productCategories.map((x) => x.name),
    );

    categories.insert(0, 'Все');

    List<Widget> tabbs = List.from(
      categories.map(
            (e) =>
            Tab(
              text: e,
            ),
      ),
    );

    var tabIndex = _tabController.index;
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: AppColors.black,
          ),
          onPressed: () {
            context.popRoute();
          },
        ),
        centerTitle: true,
        title: const Text(
          'Продукты',
          style: AppTexts.s18b,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SearchLine(
              isInputEmptyCallback: (value) {
                productsBloc.add(GetProductsSearch(search: value));
              },
            ),
            Expanded(
              child: DefaultTabController(
                length: categories.length,
                child: Column(
                  children: [
                    TabBar(
                      controller: _tabController,
                      onTap: (index) {
                        if (index == tabIndex) {} else {
                          if (index == 0) {
                            productsBloc.add(GetAllProductsEvent());
                            tabIndex = 0;
                          } else {
                            productsBloc.add(
                              GetProductsByCategoryEvent(
                                categoryName: categories[index],
                              ),
                            );
                            tabIndex = index;
                          }
                        }
                      },
                      indicatorColor: AppColors.green,
                      isScrollable: true,
                      tabAlignment: TabAlignment.start,
                      indicatorSize: TabBarIndicatorSize.tab,
                      labelColor: AppColors.green,
                      unselectedLabelColor: AppColors.grey,
                      labelStyle: AppTexts.s16grey,
                      tabs: tabbs,
                    ),
                    Expanded(
                      child: BlocBuilder<ProductsBloc, ProductsState>(
                        bloc: productsBloc,
                        builder: (context, state) {
                          if (state is ProductsLoadingState) {
                            return const Center(
                              child: CircularProgressIndicator(
                                color: AppColors.green,
                              ),
                            );
                          }
                          if (state is ProductsLoadedState) {
                            return TabBarView(
                              controller: _tabController,
                              physics: const NeverScrollableScrollPhysics(),
                              children: [
                                for (var i = 0; i < categories.length; i++)
                                  CustomGridView(
                                    state: state,
                                  ),
                              ],
                            );
                          }
                          if (state is ProductsErrorState) {
                            var textt = state.error.message.toString();
                            return SizedBox(
                              child: Center(
                                child: Text(textt),
                              ),
                            );
                          }
                          return const SizedBox();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        elevation: 20,
        onPressed: () {},
        icon: Icon(
          Icons.shopping_bag,
          size: 30,
          color: AppColors.white,
        ),
        label: BlocBuilder<OrderBloc, OrderState>(
          builder: (context, state) {
            if(state is OrderLoadingState){

            }
            if(state is OrderLoadedState){
              return Text(
                'Корзина ${state.totalPrice}с',
                style: TextStyle(fontSize: 16, color: AppColors.white),
              );
            }
            return Text(
              'Корзина',
              style: TextStyle(fontSize: 16, color: AppColors.white),
            );
          },
        ),
        backgroundColor: AppColors.green,
      ),
    );
  }
}
