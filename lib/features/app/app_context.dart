import 'package:eco_market/common/routes/app_router.dart';
import 'package:eco_market/features/basket/logic/order_bloc.dart';
import 'package:eco_market/features/basket/repository/order_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppContext extends StatelessWidget {
  AppContext({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => OrderBloc(OrderRepository()),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: _appRouter.config(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
