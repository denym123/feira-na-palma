import 'package:cached_network_image/cached_network_image.dart';
import 'package:feira_na_palma/core/extensions/theme.dart';
import 'package:flutter/material.dart';

import '../../core/core.dart';
import 'product_detail.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState
    extends PageLifeCycleState<ProductDetailController, ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
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
                  imageUrl: "https://picsum.photos/300/300",
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
                        "Alface Crespa",
                        style: context.textTheme.titleLarge,
                      ),
                      Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                        style: context.textTheme.bodyMedium?.copyWith(
                          color: context.colorScheme.inverseSurface.withValues(
                            alpha: 0.8,
                          ),
                        ),
                      ),
                      Wrap(
                        runSpacing: 8,
                        spacing: 8,
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
                              "Orgânico",
                              style: context.textTheme.titleSmall,
                            ),
                          ),
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
                              "Sem agrotóxicos",
                              style: context.textTheme.titleSmall,
                            ),
                          ),
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
                              "Colheita diária",
                              style: context.textTheme.titleSmall,
                            ),
                          ),
                        ],
                      ),
                      _buildProductDetail(
                        "Produtor",
                        "Nome do Produtor",
                        context,
                      ),
                      _buildProductDetail(
                        "Produtor",
                        "Nome do Produtor",
                        context,
                      ),
                      _buildProductDetail(
                        "Produtor",
                        "Nome do Produtor",
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
                                "R\$3.50",
                                style: context.textTheme.titleLarge?.copyWith(
                                  color: context.colorScheme.primary,
                                ),
                              ),
                              Text("por maço"),
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
                                  onPressed: () {},
                                ),
                                Text("1"),
                                IconButton(
                                  icon: Icon(Icons.add),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      FilledButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.shopping_cart),
                            Text("Adicionar ao carrinho - 3.50 R\$"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
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
