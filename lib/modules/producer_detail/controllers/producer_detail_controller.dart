import '../../../core/core.dart';
import '../producer_detail.dart';

class ProducerDetailController
    with ControllerLifeCycle, ProducerDetailVariables {
  final ProducerDetailRepository _producer_detailRepository;

  ProducerDetailController({
    required ProducerDetailRepository producer_detailRepository,
  }) : _producer_detailRepository = producer_detailRepository;

  @override
  void onReady() {
    getFilters();
    getSearchProducts();
  }

  Future<void> search() async {
    debouncer.run(() {
      getSearchProducts();
    });
  }

  Future<void> getFilters() async {
    FutureHandler(
      future: filtersAS,
      repositoryFunction: _producer_detailRepository.getFilters(),
    ).call();
  }

  Future<void> getSearchProducts() async {
    FutureHandler(
      future: searchAS,
      repositoryFunction: _producer_detailRepository.getSearchProducts(
        searchController.text,
      ),
    ).call();
  }
}
