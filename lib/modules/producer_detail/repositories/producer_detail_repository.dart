import 'package:cloud_firestore/cloud_firestore.dart' hide Filter;
import 'package:feira_na_palma/modules/home/models/filter.dart';
import 'package:feira_na_palma/modules/home/models/product.dart';

import '../../../core/core.dart';
import '../../producers/models/producer.dart';

class ProducerDetailRepository extends RepositoryLifeCycle {
  Future<List<Filter>> getFilters() async {
    final response = await db.collection("produto_categoria").get();
    return List.from(response.docs).map((doc) {
      return Filter.fromJson(doc.data(), doc.id);
    }).toList();
  }

  Future<Producer> getProducer(String producerId) async {
    final response = await db.collection("produtores").doc(producerId).get();
    return Producer.fromJson(response.data()!, response.id);
  }

  Future<List<Product>> getSearchProducts(
    String producerId,
    String? filterId,
  ) async {
    final DocumentReference producerField = db
        .collection("produtores")
        .doc(producerId);
    DocumentReference? filterField;

    if (filterId != null) {
      filterField = db.collection("produto_categoria").doc(filterId);
    }

    final response = await db
        .collection("produtos")
        .where("produtor_id", isEqualTo: producerField)
        .where("category_id", isEqualTo: filterField)
        .get();
    return List.from(response.docs).map((doc) {
      return Product.fromJson(doc.data(), doc.id);
    }).toList();
  }
}
