import 'package:feira_na_palma/global_modules/navigation_manager/controllers/controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:signals/signals_flutter.dart';

import '../../core/core.dart';

class NavigationManagerPage extends StatefulWidget {
  const NavigationManagerPage({super.key});

  @override
  State<NavigationManagerPage> createState() => _NavigationManagerPageState();
}

class _NavigationManagerPageState
    extends
        PageLifeCycleState<NavigationManagerController, NavigationManagerPage> {
  @override
  Widget build(BuildContext context) {
    return Watch((context) {
      return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            controller.currentIndex.value = index;
            switch (index) {
              case 0:
                Modular.to.navigate(Routes.home);
                break;
              case 1:
                Modular.to.navigate(Routes.cart);
                break;
              case 2:
                Modular.to.navigate(Routes.producers);
                break;
              case 3:
                Modular.to.navigate(Routes.help);
                break;
            }
          },
          currentIndex: controller.currentIndex.value,
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.person),
              label: 'Produtores',
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.help),
              label: 'Help',
            ),
          ],
        ),
        body: RouterOutlet(),
      );
    });
  }
}
