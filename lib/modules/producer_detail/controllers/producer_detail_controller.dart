import 'package:feira_na_palma/modules/home/models/filter.dart';

import '../../../core/core.dart';
import '../producer_detail.dart';

class ProducerDetailController
    with ControllerLifeCycle, ProducerDetailVariables {
  final ProducerDetailRepository _producerDetailRepository;

  ProducerDetailController({
    required ProducerDetailRepository producerDetailRepository,
  }) : _producerDetailRepository = producerDetailRepository;

  @override
  void onInit([Map<String, dynamic>? params]) {
    producerId = params?['producer_id'];
  }

  @override
  void onReady() {
    getProducer();
    getFilters();
    getSearchProducts();
  }

  void setSelectedFilter(Filter? filter) {
    if (filter?.slug == selectedFilter.value?.slug) {
      selectedFilter.value = null;
    } else {
      selectedFilter.value = filter;
    }
    getSearchProducts();
  }

  Future<void> search() async {
    debouncer.run(() {
      getSearchProducts();
    });
  }

  Future<void> getProducer() async {
    FutureHandler(
      future: producerAS,
      repositoryFunction: _producerDetailRepository.getProducer(producerId),
    ).call();
  }

  Future<void> getFilters() async {
    FutureHandler(
      future: filtersAS,
      repositoryFunction: _producerDetailRepository.getFilters(),
    ).call();
  }

  Future<void> getSearchProducts() async {
    FutureHandler(
      future: searchAS,
      repositoryFunction: _producerDetailRepository.getSearchProducts(
        producerId,
        selectedFilter.value?.id,
      ),
    ).call();
  }
}
