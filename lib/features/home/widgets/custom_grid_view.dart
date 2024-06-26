import 'package:eco_market/common/models/order_item_model.dart';
import 'package:eco_market/common/models/product_model.dart';
import 'package:eco_market/common/utils/constants.dart';
import 'package:eco_market/features/home/screens/products/logic/products_bloc.dart';
import 'package:eco_market/features/home/widgets/product_card.dart';
import 'package:flutter/material.dart';

class CustomGridView extends StatelessWidget {
  final ProductsLoadedState state;

  const CustomGridView({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    if (state.products.isEmpty) {
      return Center(
        child: Column(
          children: [
            Image.asset(
              'assets/images/order_constraint.png',
              fit: BoxFit.cover,
            ),
            Text(
              'Ничего не нашли',
              style: AppTexts.s16grey,
            ),
          ],
        ),
      );
    } else {
      return GridView.builder(
          shrinkWrap: true,
          itemCount: state.products.length,
          // shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 11,
              crossAxisSpacing: 11,
              mainAxisExtent: 291),
          itemBuilder: (ctx, index) {
            return InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {},
              child: ProductCard(
                productModel: state.products[index],
              ),
            );
          });
    }
  }
}
