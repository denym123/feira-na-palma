import 'package:feira_na_palma/modules/producers/models/producer.dart';

import '../../../core/core.dart';
import '../../producers/producers.dart';

class ProducersRepository extends RepositoryLifeCycle {
  Future<List<Producer>> getProducers(String? search) async {
    await Future.delayed(const Duration(seconds: 2));
    return [
      Producer(name: "Producer 1", id: "1", address: "Rua 1", rating: "4.5"),
      Producer(name: "Producer 2", id: "2", address: "Rua 2", rating: "4.5"),
      Producer(name: "Producer 3", id: "3", address: "Rua 3", rating: "4.5"),
      Producer(name: "Producer 4", id: "4", address: "Rua 4", rating: "4.5"),
      Producer(name: "Producer 5", id: "5", address: "Rua 5", rating: "4.5"),
    ];
  }
}
