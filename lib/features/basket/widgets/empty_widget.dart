import 'package:auto_route/auto_route.dart';
import 'package:eco_market/common/routes/app_router.gr.dart';
import 'package:eco_market/common/utils/constants.dart';
import 'package:eco_market/common/widgets/bottom_button.dart';
import 'package:flutter/material.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Column(
            children: [
              Image.asset(
                'assets/images/order_empty.png',
                fit: BoxFit.cover,
              ),
              const Text(
                'У вас нет заказа',
                style: AppTexts.s16grey,
              ),
            ],
          ),
        ),
        BottomButton(
          title: 'Перейти в магазин',
          onTap: () {
            final tabsRouter = AutoTabsRouter.of(context);
            tabsRouter.setActiveIndex(0);  // Установить активной первую вкладку
          },
        ),
      ],
    );
  }
}
