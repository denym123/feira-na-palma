import 'package:feira_na_palma/core/extensions/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:signals/signals_flutter.dart';

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
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Carrinho", style: context.textTheme.titleLarge),
              SizedBox(height: 24),
              IconButton(
                onPressed: () {
                  controller.clearCart();
                },
                icon: Icon(Icons.shopping_cart),
              ),
              Watch((context) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: controller.userCartStore.globalCart.value.length,
                    itemBuilder: (context, index) {
                      final item =
                          controller.userCartStore.globalCart.value[index];
                      return InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 16,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: context.colorScheme.inverseSurface
                                  .withValues(alpha: 0.3),
                              width: 1,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item?.productName ?? "",
                                style: context.textTheme.titleMedium,
                              ),
                              Text(
                                item?.producerName ?? "",
                                style: context.textTheme.bodyMedium?.copyWith(
                                  color: context.colorScheme.inverseSurface
                                      .withValues(alpha: 0.5),
                                ),
                              ),
                              Text(item?.amount.toString() ?? ""),
                              Row(
                                children: [
                                  Icon(
                                    Icons.pin_drop_outlined,
                                    color: context.colorScheme.primary,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
