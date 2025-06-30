import '../../../core/core.dart';
import '../product_detail.dart';

class ProductDetailController with ControllerLifeCycle, ProductDetailVariables {
  final ProductDetailRepository _product_detailRepository;

  ProductDetailController({
    required ProductDetailRepository product_detailRepository,
  }) : _product_detailRepository = product_detailRepository;
}
