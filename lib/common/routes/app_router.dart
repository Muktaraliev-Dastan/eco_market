import 'package:auto_route/auto_route.dart';

import 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: BottomNavBar.page,
          initial: true,
          path: '/',
          children: [
            AutoRoute(page: HomeRoute.page),
            AutoRoute(page: BasketRoute.page),
            AutoRoute(page: HistoryRoute.page),
            AutoRoute(page: InfoRoute.page),
          ],
        ),
        AutoRoute(
          path: '/productsScreen',
          page: ProductsRoute.page,
        )
      ];
}
