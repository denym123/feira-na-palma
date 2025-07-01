import 'package:feira_na_palma/global_modules/user_cart/controllers/user_cart_controller.dart';
import 'package:feira_na_palma/modules/producer_detail/controllers/producer_detail_controller.dart';
import 'package:feira_na_palma/modules/product_detail/widgets/different_producer_modal.dart';
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

  void submitCart() async {
    final newProductId = productId;
    final newAmount = amount.value;
    final newProducerId = producer.id;

    final cart = userStore.globalCart.value;

    // Se o carrinho já contém produtos
    if (cart.isNotEmpty) {
      final existingProducerId = cart.first.producerId;

      if (existingProducerId != newProducerId) {
        var shouldCleanCart = await DifferentProducerModal()
            .showDifferentProducerModal();
        if (shouldCleanCart) {
          userStore.globalCart.value.clear();
          _producerDetailController.updateCartAmount();
          submitCart();
          return;
        }
        return;
      }
    }

    // Verifica se o item já existe no carrinho
    final existingItemIndex = cart.indexWhere(
      (item) => item.productId == newProductId,
    );

    if (existingItemIndex != -1) {
      // ✅ Item já existe, atualiza a quantidade
      final existingItem = cart[existingItemIndex];

      cart[existingItemIndex] = CartItem(
        producerPhone: existingItem.producerPhone,
        unit: existingItem.unit,
        productName: existingItem.productName,
        productId: existingItem.productId,
        producerId: existingItem.producerId,
        producerName: existingItem.producerName,
        amount: existingItem.amount + newAmount,
        price: productAS.value.value!.price,
      );
    } else {
      // ✅ Item novo, adiciona
      cart.add(
        CartItem(
          producerPhone: producer.phone,
          unit: productAS.value.value?.unit ?? "",
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
