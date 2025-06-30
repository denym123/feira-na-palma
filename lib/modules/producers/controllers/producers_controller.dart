import '../../../core/core.dart';
import '../producers.dart';

class ProducersController with ControllerLifeCycle, ProducersVariables {
  final ProducersRepository _producersRepository;

  ProducersController({required ProducersRepository producersRepository})
    : _producersRepository = producersRepository;

  @override
  void onReady() {
    super.onReady();
    getSearchProducers();
  }

  Future<void> search() async {
    debouncer.run(() {
      getSearchProducers();
    });
  }

  Future<void> getSearchProducers() async {
    FutureHandler(
      future: searchAS,
      repositoryFunction: _producersRepository.getProducers(
        searchController.text,
      ),
    ).call();
  }
}
