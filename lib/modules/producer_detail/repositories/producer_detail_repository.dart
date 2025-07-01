import 'package:feira_na_palma/modules/home/models/filter.dart';
import 'package:feira_na_palma/modules/home/models/product.dart';

import '../../../core/core.dart';
import '../../producer_detail/producer_detail.dart';

class ProducerDetailRepository extends RepositoryLifeCycle {
  Future<List<Filter>> getFilters() async {
    await Future.delayed(const Duration(seconds: 2));
    return [];
  }

  Future<List<Product>> getSearchProducts(String? search) async {
    await Future.delayed(const Duration(seconds: 2));
    return [];
  }
}
