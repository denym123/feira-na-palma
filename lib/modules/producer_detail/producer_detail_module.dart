import 'package:flutter_modular/flutter_modular.dart';
import '../../core/core.dart';
import 'producer_detail.dart';

class ProducerDetailModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(ProducerDetailController.new);
    i.add(ProducerDetailRepository.new);
  }

  @override
  void routes(r) {
    r.child(
      Modular.initialRoute,
      child: (context) => const ProducerDetailPage(),
    );
  }
}
