import 'package:flutter_modular/flutter_modular.dart';
import 'cart.dart';

 class CartModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(CartController.new);
    i.add(CartRepository.new);
  }

  @override
  void routes(r) {
    r.child(
      Modular.initialRoute,
      child: (context) => const CartPage()
    );
  }
}
