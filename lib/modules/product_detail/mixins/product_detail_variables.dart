import 'package:feira_na_palma/modules/home/models/product.dart';
import 'package:feira_na_palma/modules/producers/models/producer.dart';
import 'package:signals/signals_flutter.dart';

mixin ProductDetailVariables {
  late String productId;
  late Producer producer;

  Signal<int> amount = Signal(1);

  AsyncSignal<Product?> productAS = AsyncSignal<Product?>(AsyncLoading());
}
