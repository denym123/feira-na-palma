import 'package:feira_na_palma/modules/producers/models/producer.dart';

import '../../../core/core.dart';

class ProducersRepository extends RepositoryLifeCycle {
  Future<List<Producer>> getProducers(String? search) async {
    final response = await db
        .collection("produtores")
        .where("name", isGreaterThanOrEqualTo: search)
        .get();
    return List.from(response.docs).map((doc) {
      return Producer.fromJson(doc.data(), doc.id);
    }).toList();
  }
}
