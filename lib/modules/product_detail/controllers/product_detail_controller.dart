import 'package:feira_na_palma/global_modules/user_cart/controllers/user_cart_controller.dart';
import 'package:feira_na_palma/modules/producer_detail/controllers/producer_detail_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/core.dart';
import '../product_detail.dart';

class ProductDetailController with ControllerLifeCycle, ProductDetailVariables {
  final ProducerDetailController _producerDetailController =
      Modular.get<ProducerDetailController>();
  final UserCartStore userStore = Modular.get<UserCartStore>();
  final ProductDetailRepository _productDetailRepository;

  ProductDetailController({
    required ProductDetailRepository productDetailRepository,
  }) : _productDetailRepository = productDetailRepository;

  @override
  onInit([Map<String, dynamic>? params]) {
    producer = params?['producer'];
    productId = params?['product_id'];
  }

  @override
  void onReady() {
    getProduct();
  }

  void submitCart() {
    final newProductId = productId;
    final newAmount = amount.value;

    // Verifica se o item já existe no carrinho
    final existingItemIndex = userStore.globalCart.value.indexWhere(
      (item) => item.productId == newProductId,
    );

    if (existingItemIndex != -1) {
      // Item já existe, aumenta o amount
      final existingItem = userStore.globalCart.value[existingItemIndex];

      userStore.globalCart.value[existingItemIndex] = CartItem(
        productName: existingItem.productName,
        productId: existingItem.productId,
        producerId: existingItem.producerId,
        producerName: existingItem.producerName,
        amount: existingItem.amount + newAmount,
        price: productAS.value.value!.price,
      );
    } else {
      // Item ainda não existe, adiciona normalmente
      userStore.globalCart.value.add(
        CartItem(
          productName: productAS.value.value?.name ?? "",
          productId: productId,
          producerId: producer.id,
          producerName: producer.name,
          amount: amount.value,
          price: productAS.value.value!.price,
        ),
      );
    }

    _producerDetailController.updateCartAmount();
    Modular.to.pop();
  }

  Future<void> getProduct() async {
    FutureHandler(
      future: productAS,
      repositoryFunction: _productDetailRepository.getProduct(productId),
    ).call();
  }
}
