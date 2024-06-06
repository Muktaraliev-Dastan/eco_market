// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:eco_market/common/bottom_nav_bar.dart' as _i2;
import 'package:eco_market/features/basket/basket_screen.dart' as _i1;
import 'package:eco_market/features/history/history_screen.dart' as _i3;
import 'package:eco_market/features/home/home_screen.dart' as _i4;
import 'package:eco_market/features/home/screens/products/products_screen.dart' as _i6;
import 'package:eco_market/features/info/info_screen.dart' as _i5;

abstract class $AppRouter extends _i7.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    BasketRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.BasketScreen(),
      );
    },
    BottomNavBar.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.BottomNavBar(),
      );
    },
    HistoryRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HistoryScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.HomeScreen(),
      );
    },
    InfoRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.InfoScreen(),
      );
    },
    ProductsRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.ProductsScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.BasketScreen]
class BasketRoute extends _i7.PageRouteInfo<void> {
  const BasketRoute({List<_i7.PageRouteInfo>? children})
      : super(
          BasketRoute.name,
          initialChildren: children,
        );

  static const String name = 'BasketRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i2.BottomNavBar]
class BottomNavBar extends _i7.PageRouteInfo<void> {
  const BottomNavBar({List<_i7.PageRouteInfo>? children})
      : super(
          BottomNavBar.name,
          initialChildren: children,
        );

  static const String name = 'BottomNavBar';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i3.HistoryScreen]
class HistoryRoute extends _i7.PageRouteInfo<void> {
  const HistoryRoute({List<_i7.PageRouteInfo>? children})
      : super(
          HistoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'HistoryRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i4.HomeScreen]
class HomeRoute extends _i7.PageRouteInfo<void> {
  const HomeRoute({List<_i7.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i5.InfoScreen]
class InfoRoute extends _i7.PageRouteInfo<void> {
  const InfoRoute({List<_i7.PageRouteInfo>? children})
      : super(
          InfoRoute.name,
          initialChildren: children,
        );

  static const String name = 'InfoRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i6.ProductsScreen]
class ProductsRoute extends _i7.PageRouteInfo<void> {
  const ProductsRoute({List<_i7.PageRouteInfo>? children})
      : super(
          ProductsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProductsRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}
