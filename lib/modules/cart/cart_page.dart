import 'package:flutter/material.dart';

import '../../core/core.dart';
import 'cart.dart';

 class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends PageLifeCycleState<CartController, CartPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
