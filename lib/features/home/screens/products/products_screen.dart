import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:eco_market/common/utils/constants.dart';
import 'package:eco_market/features/home/widgets/product_card.dart';
import 'package:eco_market/features/home/widgets/search_line.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int totalPrice = 0;
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
            SearchLine(),
            Expanded(
              child: GridView.builder(
                  itemCount: 10,
                  // shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 11,
                    crossAxisSpacing: 11,
                    mainAxisExtent: 291
                  ),
                  itemBuilder: (ctx, index) {
                    return InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () {},
                      child: ProductCard(
                        price: 100,
                        title: 'Яблоко красная радуга сладкая',
                        pathToImage: 'https://www.openbusiness.ru/upload/iblock/1e4/uh6104uo8wpsghramhrje6biisafjyuq/apple_garden1.jpg',
                      ),
                    );
                  }),
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
        label: Text(
          'Корзина $totalPrice c',
          style: TextStyle(fontSize: 16, color: AppColors.white),
        ),
        backgroundColor: AppColors.green,
      ),
    );
  }
}
