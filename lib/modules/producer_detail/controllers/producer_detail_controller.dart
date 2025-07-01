import 'package:feira_na_palma/global_modules/navigation_manager/controllers/controllers.dart';
import 'package:feira_na_palma/global_modules/user_cart/controllers/user_cart_controller.dart';
import 'package:feira_na_palma/modules/home/models/filter.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/core.dart';
import '../producer_detail.dart';

class ProducerDetailController
    with ControllerLifeCycle, ProducerDetailVariables {
  final NavigationManagerController _navigationManagerController =
      Modular.get<NavigationManagerController>();
  final UserCartStore userCartStore = Modular.get<UserCartStore>();
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
    getCartAmount();
    getProducer();
    getFilters();
    getSearchProducts();
  }

  void getCartAmount() {
    cartAmount.value = userCartStore.globalCart.value.length;
  }

  void updateCartAmount() {
    cartAmount.value = 0;
    for (var element in userCartStore.globalCart.value) {
      cartAmount.value = cartAmount.value + element.amount;
    }
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

  void goToCart() {
    _navigationManagerController.currentIndex.value = 1;
    Modular.to.navigate(Routes.cart);
  }
}
