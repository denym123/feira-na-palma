import '../../../core/core.dart';
import '../product_detail.dart';

class ProductDetailController with ControllerLifeCycle, ProductDetailVariables {
  final ProductDetailRepository _productDetailRepository;

  ProductDetailController({
    required ProductDetailRepository productDetailRepository,
  }) : _productDetailRepository = productDetailRepository;

  @override
  onInit([Map<String, dynamic>? params]) {
    productId = params?['product_id'];
  }

  @override
  void onReady() {
    getProduct();
  }

  Future<void> getProduct() async {
    FutureHandler(
      future: productAS,
      repositoryFunction: _productDetailRepository.getProduct(productId),
    ).call();
  }
}
