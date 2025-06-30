import 'package:feira_na_palma/core/core.dart';
import 'package:flutter/widgets.dart';
import 'package:signals/signals_flutter.dart';

mixin ProducersVariables {
  Debouncer debouncer = Debouncer(milliseconds: 500);
  TextEditingController searchController = TextEditingController();

  AsyncSignal searchAS = AsyncSignal(AsyncLoading());
}
