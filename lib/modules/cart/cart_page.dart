import 'package:feira_na_palma/core/extensions/theme.dart';
import 'package:flutter/material.dart';
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
            spacing: 16,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Carrinho", style: context.textTheme.titleLarge),
              Row(
                spacing: 24,
                children: [
                  Text("Limpar Carrinho", style: context.textTheme.titleMedium),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        controller.clearCart();
                      });
                    },
                    icon: Icon(Icons.delete),
                  ),
                ],
              ),
              Watch((context) {
                return Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 16),
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                spacing: 8,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.productName,
                                    style: context.textTheme.titleMedium,
                                  ),
                                  Text(
                                    item.producerName,
                                    style: context.textTheme.bodyMedium
                                        ?.copyWith(
                                          color: context
                                              .colorScheme
                                              .inverseSurface
                                              .withValues(alpha: 0.5),
                                        ),
                                  ),
                                  Text(
                                    "${item.price.toBRL()} por ${item.unit}",
                                  ),
                                  Text("Quantidade: ${item.amount}"),
                                  Row(
                                    spacing: 8,
                                    children: [
                                      Icon(
                                        Icons.monetization_on,
                                        color: context.colorScheme.primary,
                                      ),
                                      Text(
                                        "Total: ${(item.amount * item.price).toBRL()}",
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    controller.userCartStore.globalCart.value
                                        .removeAt(index);
                                  });
                                },
                                icon: Icon(Icons.close),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              }),
              Container(
                padding: EdgeInsets.all(16),
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: context.colorScheme.inverseSurface.withValues(
                        alpha: 0.3,
                      ),
                      width: 1,
                    ),
                    right: BorderSide(
                      color: context.colorScheme.inverseSurface.withValues(
                        alpha: 0.3,
                      ),
                      width: 1,
                    ),
                    left: BorderSide(
                      color: context.colorScheme.inverseSurface.withValues(
                        alpha: 0.3,
                      ),
                      width: 1,
                    ),
                  ),
                  color: context.backgroundColor,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Total: ${(controller.userCartStore.globalCart.value.fold<double>(0, (previousValue, element) => previousValue + element.amount * element.price)).toBRL()}",
                      style: context.textTheme.titleMedium,
                    ),
                    FilledButton(
                      onPressed: () {},
                      child: Text("Enviar ao produtor"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
