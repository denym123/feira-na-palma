import 'package:feira_na_palma/global_modules/navigation_manager/navigation_manager_module.dart';
import 'package:feira_na_palma/modules/producer_detail/producer_detail_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../core/constants/route.dart';
import '../global_modules/core/core_module.dart';
import '../modules/modules.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [CoreModule()];

  @override
  void routes(RouteManager r) {
    r.module(Routes.splash, module: SplashModule());
    r.module(Routes.navigationManager, module: NavigationManagerModule());
    r.module(Routes.productDetail, module: ProductDetailModule());
    r.module(Routes.producerDetail, module: ProducerDetailModule());
  }
}
