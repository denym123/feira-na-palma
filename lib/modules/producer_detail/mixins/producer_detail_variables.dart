import 'package:feira_na_palma/core/helpers/debouncer.dart';
import 'package:feira_na_palma/modules/home/models/filter.dart';
import 'package:feira_na_palma/modules/home/models/product.dart';
import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';

mixin ProducerDetailVariables {
  TextEditingController searchController = TextEditingController();
  Debouncer debouncer = Debouncer(milliseconds: 500);

  Signal<String?> selectedFilter = Signal(null);

  AsyncSignal<List<Product>?> searchAS = AsyncSignal(AsyncLoading());
  AsyncSignal<List<Filter>?> filtersAS = AsyncSignal(AsyncLoading());
}
