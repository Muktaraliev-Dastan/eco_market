import 'package:auto_route/annotations.dart';
import 'package:eco_market/common/utils/constants.dart';
import 'package:eco_market/common/widgets/bottom_button.dart';
import 'package:flutter/material.dart';

@RoutePage()
class BasketScreen extends StatelessWidget {
  const BasketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Корзина',
            style: AppTexts.s18b,
          ),
          centerTitle: true,
          leadingWidth: 120,
          leading: const Center(
            child: Row(
              children: [
                SizedBox(width: 16),
                Text(
                  'Очистить',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.red,
                      fontFamily: 'TTNormsPro'),
                ),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Spacer(),
              BottomButton(title: 'Оформить заказ'),
            ],
          ),
        ));
  }
}
