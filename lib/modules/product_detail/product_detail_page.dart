import 'package:flutter/material.dart';

import '../../core/core.dart';
import 'product_detail.dart';

 class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends PageLifeCycleState<ProductDetailController, ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
