import 'package:eco_market/features/app/app_context.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const EcoMarket());
}

class EcoMarket extends StatelessWidget {
  const EcoMarket({super.key});

  @override
  Widget build(BuildContext context) {
    return AppContext();
  }
}
