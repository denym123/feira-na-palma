import 'package:feira_na_palma/global_modules/user_cart/controllers/user_cart_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core/core.dart';

class CoreModule extends Module {
  @override
  void exportedBinds(Injector i) {
    i.addLazySingleton(UserStore.new);
    i.addLazySingleton(UserCartStore.new);
  }
}
