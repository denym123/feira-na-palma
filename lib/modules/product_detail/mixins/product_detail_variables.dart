import 'package:feira_na_palma/modules/home/models/product.dart';
import 'package:signals/signals_flutter.dart';

mixin ProductDetailVariables {
  late String productId;

  AsyncSignal<Product?> productAS = AsyncSignal<Product?>(AsyncLoading());
}
