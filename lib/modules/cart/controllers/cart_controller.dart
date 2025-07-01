import 'package:feira_na_palma/global_modules/user_cart/controllers/user_cart_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/core.dart';
import '../cart.dart';

class CartController with ControllerLifeCycle, CartVariables {
  final UserCartStore _userCartStore = Modular.get<UserCartStore>();
  final CartRepository _cartRepository;

  CartController({required CartRepository cartRepository})
    : _cartRepository = cartRepository;
}
