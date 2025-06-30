import 'package:feira_na_palma/modules/home/models/filter.dart';
import 'package:feira_na_palma/modules/home/models/product.dart';

import '../../../core/core.dart';
import '../../producer_detail/producer_detail.dart';

class ProducerDetailRepository extends RepositoryLifeCycle {
  Future<List<Filter>> getFilters() async {
    await Future.delayed(const Duration(seconds: 2));
    return [
      Filter(name: "Todos", slug: "all"),
      Filter(name: "Verdura", slug: "verdura"),
      Filter(name: "Legumes", slug: "legumes"),
      Filter(name: "Frutas", slug: "frutas"),
    ];
  }

  Future<List<Product>> getSearchProducts(String? search) async {
    await Future.delayed(const Duration(seconds: 2));
    return [
      Product(
        name: "Produto 1",
        id: "1",
        image: "https://picsum.photos/id/10/200/300",
        price: "R\$ 100",
        unit: "Kg",
        producerName: "Producer 1",
      ),
      Product(
        name: "Produto 2",
        id: "2",
        image: "https://picsum.photos/id/10/200/300",
        price: "R\$ 100",
        unit: "Kg",
        producerName: "Producer 2",
      ),
      Product(
        name: "Produto 3",
        id: "3",
        image: "https://picsum.photos/id/10/200/300",
        price: "R\$ 100",
        unit: "Kg",
        producerName: "Producer 3",
      ),
      Product(
        name: "Produto 4",
        id: "4",
        image: "https://picsum.photos/id/10/200/300",
        price: "R\$ 100",
        unit: "Kg",
        producerName: "Producer 4",
      ),
      Product(
        name: "Produto 5",
        id: "5",
        image: "https://picsum.photos/id/10/200/300",
        price: "R\$ 100",
        unit: "Kg",
        producerName: "Producer 5",
      ),
    ];
  }
}
