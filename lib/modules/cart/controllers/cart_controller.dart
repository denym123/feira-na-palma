import '../../../core/core.dart';
import '../cart.dart';

class CartController with ControllerLifeCycle, CartVariables {
  final CartRepository _cartRepository;

  CartController({
    required CartRepository cartRepository,
  }) : _cartRepository = cartRepository;
}
