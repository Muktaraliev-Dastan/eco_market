import 'package:eco_market/common/routes/app_router.dart';
import 'package:flutter/material.dart';

class AppContext extends StatelessWidget {
  AppContext({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
      debugShowCheckedModeBanner: false,
    );
  }
}
