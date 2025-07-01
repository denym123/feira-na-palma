import 'package:feira_na_palma/core/helpers/helpers.dart';
import 'package:flutter/widgets.dart';
import 'package:signals/signals_flutter.dart';

import '../home.dart';

mixin HomeVariables {
  TextEditingController searchController = TextEditingController();
  Debouncer debouncer = Debouncer(milliseconds: 500);

  Signal<Filter?> selectedFilter = Signal(null);

  AsyncSignal<List<Product>?> searchAS = AsyncSignal(AsyncLoading());
  AsyncSignal<List<Filter>?> filtersAS = AsyncSignal(AsyncLoading());
}
