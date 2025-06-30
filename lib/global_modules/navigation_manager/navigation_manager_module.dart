import 'package:feira_na_palma/global_modules/navigation_manager/controllers/navigation_manager_controller.dart';
import 'package:feira_na_palma/global_modules/navigation_manager/navigation_manager_page.dart';
import 'package:feira_na_palma/modules/modules.dart';
import 'package:flutter_modular/flutter_modular.dart';

class NavigationManagerModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(NavigationManagerController.new);
  }

  @override
  void routes(r) {
    r.child(
      Modular.initialRoute,
      child: (context) => const NavigationManagerPage(),
      transition: TransitionType.noTransition,
      children: [
        ModuleRoute("/home", module: HomeModule()),
        ModuleRoute("/cart", module: CartModule()),
        ModuleRoute("/producers", module: ProducersModule()),
        ModuleRoute("/help", module: HelpModule()),
      ],
    );
  }
}
