import 'package:flutter_modular/flutter_modular.dart';
import 'help.dart';

 class HelpModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(HelpController.new);
    i.add(HelpRepository.new);
  }

  @override
  void routes(r) {
    r.child(
      Modular.initialRoute,
      child: (context) => const HelpPage()
    );
  }
}
