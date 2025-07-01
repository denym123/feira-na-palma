import 'package:feira_na_palma/modules/home/models/product.dart';

import '../../../core/core.dart';

class ProductDetailRepository extends RepositoryLifeCycle {
  Future<Product> getProduct(String productId) async {
    final response = await db.collection("produtos").doc(productId).get();
    return Product.fromJson(response.data()!, response.id);
  }
}
