import '../../../core/core.dart';
import '../producers.dart';

class ProducersController with ControllerLifeCycle, ProducersVariables {
  final ProducersRepository _producersRepository;

  ProducersController({
    required ProducersRepository producersRepository,
  }) : _producersRepository = producersRepository;
}
