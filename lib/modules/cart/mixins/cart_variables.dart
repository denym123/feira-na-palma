import 'package:feira_na_palma/core/core.dart';
import 'package:signals/signals_flutter.dart';

mixin CartVariables {
  Signal<List<CartItem>> cartItemList = Signal<List<CartItem>>([]);
}
