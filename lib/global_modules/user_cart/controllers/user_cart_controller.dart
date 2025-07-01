import 'package:feira_na_palma/core/core.dart';
import 'package:signals/signals_flutter.dart';

class UserCartStore {
  Signal<List<CartItem>> globalCart = Signal<List<CartItem>>([]);
}
