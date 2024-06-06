import 'package:auto_route/annotations.dart';
import 'package:eco_market/common/utils/constants.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'История заказов',
          style: AppTexts.s18b,
        ),
        centerTitle: true,
      ),
      body: Column(),
    );
  }
}
