import 'package:auto_route/auto_route.dart';
import 'package:eco_market/common/utils/constants.dart';
import 'package:eco_market/features/home/logic/home_bloc.dart';
import 'package:eco_market/features/home/repository/product_category_repository.dart';
import 'package:eco_market/features/home/widgets/type_product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeBloc homeBloc = HomeBloc(ProductCategoryRepository());

  @override
  void initState() {
    homeBloc.add(GetAllProductsCategoryEvent());
    super.initState();
  }

  @override
  void dispose() {
    homeBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Эко Маркет',
          style: AppTexts.s24b,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<HomeBloc, HomeState>(
          bloc: homeBloc,
          builder: (context, state) {
            if (state is HomeLoadingState) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.green,
                ),
              );
            }
            if (state is HomeLoadedState) {
              return GridView.builder(
                  itemCount: state.productCategories.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 11,
                      crossAxisSpacing: 11),
                  itemBuilder: (ctx, index) {
                    return InkWell(
                      onTap: () {
                        context.router.pushNamed('/productsScreen');
                      },
                      child: TypeProductCard(
                        productCategoryModel: state.productCategories[index],
                      ),
                    );
                  });
            }
            if (state is HomeErrorState) {
              return const SizedBox(
                child: Center(
                  child: Text("ERROR"),
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
