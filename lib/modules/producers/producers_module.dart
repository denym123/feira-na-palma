import 'package:flutter_modular/flutter_modular.dart';
import 'producers.dart';

 class ProducersModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(ProducersController.new);
    i.add(ProducersRepository.new);
  }

  @override
  void routes(r) {
    r.child(
      Modular.initialRoute,
      child: (context) => const ProducersPage()
    );
  }
}
