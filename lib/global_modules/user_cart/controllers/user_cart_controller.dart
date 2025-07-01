import 'package:feira_na_palma/modules/modules.dart';
import 'package:signals/signals_flutter.dart';

class UserCartStore {
  Signal<List<Product>> globalCart = Signal<List<Product>>([]);
}
