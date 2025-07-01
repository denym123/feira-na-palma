import 'package:cloud_firestore/cloud_firestore.dart' hide Filter;

import '../../../core/core.dart';
import '../../home/home.dart';

class HomeRepository extends RepositoryLifeCycle {
  Future<List<Filter>> getFilters() async {
    final response = await db.collection("produto_categoria").get();
    return response.docs.map((doc) {
      return Filter.fromJson(doc.data(), doc.id);
    }).toList();
  }

  Future<List<Product>> getSearchProducts(
    String? search,
    String? filterId,
  ) async {
    DocumentReference? field;

    if (filterId != null) {
      field = db.collection("produto_categoria").doc(filterId);
    }

    final response = await db
        .collection("produtos")
        .where("name", isGreaterThanOrEqualTo: search)
        .where("category_id", isEqualTo: field)
        .get();

    return List.from(response.docs).map((doc) {
      return Product.fromJson(doc.data(), doc.id);
    }).toList();
  }
}
