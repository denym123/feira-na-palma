import '../../../core/core.dart';
import '../home.dart';

class HomeController with ControllerLifeCycle, HomeVariables {
  final HomeRepository _homeRepository;

  HomeController({required HomeRepository homeRepository})
    : _homeRepository = homeRepository;

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
      repositoryFunction: _homeRepository.getFilters(),
    ).call();
  }

  Future<void> getSearchProducts() async {
    FutureHandler(
      future: searchAS,
      repositoryFunction: _homeRepository.getSearchProducts(
        searchController.text,
      ),
    ).call();
  }
}
