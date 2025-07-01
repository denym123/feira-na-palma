import 'package:cached_network_image/cached_network_image.dart';
import 'package:feira_na_palma/core/extensions/theme.dart';
import 'package:feira_na_palma/modules/producers/models/producer.dart';
import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';

import '../../core/core.dart';
import 'product_detail.dart';

class ProductDetailPage extends StatefulWidget {
  final String productId;
  final Producer producer;

  const ProductDetailPage({
    super.key,
    required this.productId,
    required this.producer,
  });

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState
    extends PageLifeCycleState<ProductDetailController, ProductDetailPage> {
  @override
  Map<String, dynamic>? get params => {
    'product_id': widget.productId,
    'producer': widget.producer,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Watch((context) {
          return SingleChildScrollView(
            child: SignalFutureBuilder(
              asyncState: controller.productAS.value,
              builder: (data) {
                return Column(
                  spacing: 16,
                  children: [
                    Row(
                      spacing: 24,
                      children: [
                        BackButton(),
                        Text(
                          "Detalhe do produto",
                          style: context.textTheme.titleMedium,
                        ),
                      ],
                    ),
                    Divider(height: 0),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: CachedNetworkImage(
                        height: 200,
                        width: 200,
                        imageUrl: data?.image ?? "",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: context.backgroundColor,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: context.colorScheme.shadow.withValues(
                                alpha: 0.1,
                              ),
                              blurRadius: 8,
                              offset: const Offset(0, 0),
                            ),
                          ],
                        ),
                        child: Column(
                          spacing: 12,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              data?.name ?? "",
                              style: context.textTheme.titleLarge,
                            ),
                            Text(
                              data?.description ?? "",
                              style: context.textTheme.bodyMedium?.copyWith(
                                color: context.colorScheme.inverseSurface
                                    .withValues(alpha: 0.8),
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: context.primaryColor.withValues(
                                      alpha: 0.2,
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    vertical: 4,
                                    horizontal: 16,
                                  ),
                                  child: Text(
                                    data?.productCategorySlug ?? "",
                                    style: context.textTheme.titleSmall,
                                  ),
                                ),
                              ],
                            ),

                            _buildProductDetail(
                              "Produtor",
                              widget.producer.name,
                              context,
                            ),
                            _buildProductDetail(
                              "Unidade",
                              "Venda por ${data?.unit ?? ""}",
                              context,
                            ),
                            Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data?.price.toBRL() ?? "",
                                      style: context.textTheme.titleLarge
                                          ?.copyWith(
                                            color: context.colorScheme.primary,
                                          ),
                                    ),
                                    Text("por ${data?.unit ?? ""}"),
                                  ],
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: context.colorScheme.onInverseSurface,
                                  ),
                                  child: Row(
                                    children: [
                                      IconButton(
                                        icon: Icon(Icons.remove),
                                        onPressed: () {
                                          if (controller.amount.value > 1) {
                                            controller.amount.value--;
                                          }
                                        },
                                      ),
                                      Watch((context) {
                                        return Text("${controller.amount}");
                                      }),
                                      IconButton(
                                        icon: Icon(Icons.add),
                                        onPressed: () {
                                          controller.amount.value++;
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            FilledButton(
                              onPressed: () {
                                controller.submitCart();
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.shopping_cart),
                                  Watch((context) {
                                    return Text(
                                      "Adicionar ao carrinho - ${(controller.amount.value * data!.price).toBRL()} R\$",
                                    );
                                  }),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        }),
      ),
    );
  }

  Widget _buildProductDetail(
    String title,
    String subtitle,
    BuildContext context,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: context.textTheme.bodyMedium?.copyWith(
            color: context.colorScheme.inverseSurface.withValues(alpha: 0.8),
          ),
        ),
        Text(
          subtitle,
          style: context.textTheme.bodyMedium?.copyWith(
            color: context.colorScheme.inverseSurface.withValues(alpha: 0.8),
          ),
        ),
      ],
    );
  }
}
