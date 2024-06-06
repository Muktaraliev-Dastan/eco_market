import 'package:auto_route/annotations.dart';
import 'package:eco_market/common/utils/constants.dart';
import 'package:flutter/material.dart';

@RoutePage()
class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height * 0.35,
              width: double.infinity,
              child: Image.asset(
                'assets/images/info.png',
                fit: BoxFit.cover,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Эко Маркет',
                    style: AppTexts.s24b,
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Фрукты, овощи, зелень, сухофрукты а так же сделанные из натуральных ЭКО продуктов (варенье, салаты, соления, компоты и т.д.) можете заказать удобно, качественно и по доступной цене. Готовы сотрудничать взаимовыгодно с магазинами. Наши цены как на рынке. Мы заинтересованы в экономии ваших денег и времени. Стоимость доставки 150 сом и ещё добавлен для окраину города. При отказе подтвержденного заказа более 2-х раз Клиент заносится в чёрный список!!",
                  style: AppTexts.s16grey,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
