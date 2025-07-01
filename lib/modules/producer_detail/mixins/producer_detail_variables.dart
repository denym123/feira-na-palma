import 'package:feira_na_palma/core/helpers/debouncer.dart';
import 'package:feira_na_palma/modules/home/models/filter.dart';
import 'package:feira_na_palma/modules/home/models/product.dart';
import 'package:feira_na_palma/modules/producers/models/producer.dart';
import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';

mixin ProducerDetailVariables {
  late String producerId;

  TextEditingController searchController = TextEditingController();
  Debouncer debouncer = Debouncer(milliseconds: 500);

  Signal<Filter?> selectedFilter = Signal(null);

  AsyncSignal<Producer?> producerAS = AsyncSignal(AsyncLoading());
  AsyncSignal<List<Product>?> searchAS = AsyncSignal(AsyncLoading());
  AsyncSignal<List<Filter>?> filtersAS = AsyncSignal(AsyncLoading());
}
