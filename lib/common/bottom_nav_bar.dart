import 'package:auto_route/auto_route.dart';
import 'package:eco_market/common/routes/app_router.gr.dart';
import 'package:eco_market/common/utils/constants.dart';
import 'package:flutter/material.dart';

@RoutePage()
class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        HomeRoute(),
        BasketRoute(),
        HistoryRoute(),
        InfoRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.white,
            showUnselectedLabels: true,
            iconSize: 25,
            selectedItemColor: AppColors.green,
            unselectedItemColor:AppColors.grey,
            selectedLabelStyle: AppTexts.s12g,
            unselectedLabelStyle: AppTexts.s12grey,
            type: BottomNavigationBarType.fixed,
            currentIndex: tabsRouter.activeIndex,
            onTap: (value) {
              tabsRouter.setActiveIndex(value);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Главная",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_basket),
                label: "Корзина",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.access_time_rounded),
                label: "История",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.info_outline),
                label: "Инфо",
              ),
            ],
          ),
        );
      },
    );
  }
}
