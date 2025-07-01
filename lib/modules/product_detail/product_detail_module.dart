import 'package:flutter_modular/flutter_modular.dart';
import 'product_detail.dart';

class ProductDetailModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(ProductDetailController.new);
    i.add(ProductDetailRepository.new);
  }

  @override
  void routes(r) {
    r.child(
      Modular.initialRoute,
      child: (context) => ProductDetailPage(
        productId: r.args.data['product_id'],
        producer: r.args.data['producer'],
      ),
    );
  }
}
