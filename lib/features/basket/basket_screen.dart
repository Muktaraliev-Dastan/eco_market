import 'package:auto_route/annotations.dart';
import 'package:eco_market/common/utils/constants.dart';
import 'package:eco_market/common/widgets/bottom_button.dart';
import 'package:eco_market/features/basket/logic/order_bloc.dart';
import 'package:eco_market/features/basket/widgets/empty_widget.dart';
import 'package:eco_market/features/basket/widgets/selected_product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class BasketScreen extends StatelessWidget {
  const BasketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<OrderBloc>();
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Корзина',
            style: AppTexts.s18b,
          ),
          centerTitle: true,
          leadingWidth: 125,
          leading: BlocBuilder<OrderBloc, OrderState>(
            bloc: bloc,
            builder: (context, state) {
              if (state is OrderLoadedState) {
                if (state.selectedProducts.isEmpty) {
                  return const SizedBox();
                } else {
                  return Center(
                    child: Row(
                      children: [
                        SizedBox(width: 10),
                        TextButton(
                          onPressed: () {
                            bloc.add(DeleteAllSelectedProducts());
                          },
                          child: const Text(
                            'Очистить',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.red,
                                fontFamily: 'TTNormsPro'),
                          ),
                        )
                      ],
                    ),
                  );
                }
              }
              return const SizedBox();
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: BlocBuilder<OrderBloc, OrderState>(
            bloc: bloc,
            builder: (context, state) {
              if (state is OrderLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(color: AppColors.green),
                );
              }
              if (state is OrderLoadedState) {
                if (state.selectedProducts.isNotEmpty) {
                  return Column(
                    children: [
                      Expanded(
                        child: ListView.separated(
                          itemCount: state.selectedProducts.length,
                          itemBuilder: (context, index) {
                            return SelectedProductCard(
                              selectedProductsModel:
                                  state.selectedProducts[index],
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(height: 12);
                          },
                        ),
                      ),
                      SizedBox(height: 10),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Сумма',
                                style: AppTexts.s16grey,
                              ),
                              Text(
                                '${state.totalPrice} c',
                                style: AppTexts.s16b,
                              )
                            ],
                          ),
                          SizedBox(height: 8),

                        ],
                      ),
                      BottomButton(
                        title: 'Оформить заказ',
                        onTap: () {},
                      ),
                    ],
                  );
                }
              }
              return const EmptyWidget();
            },
          ),
        ));
  }
}
