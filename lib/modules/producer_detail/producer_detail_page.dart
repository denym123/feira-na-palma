import 'package:cached_network_image/cached_network_image.dart';
import 'package:feira_na_palma/core/extensions/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shimmer/shimmer.dart';
import 'package:signals/signals_flutter.dart';

import '../../core/core.dart';
import 'producer_detail.dart';

class ProducerDetailPage extends StatefulWidget {
  final String? producerId;

  const ProducerDetailPage({super.key, required this.producerId});

  @override
  State<ProducerDetailPage> createState() => _ProducerDetailPageState();
}

class _ProducerDetailPageState
    extends PageLifeCycleState<ProducerDetailController, ProducerDetailPage> {
  @override
  Map<String, dynamic>? get params => {'producer_id': widget.producerId};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BackButton(),
            Watch((context) {
              return SignalFutureBuilder(
                asyncState: controller.producerAS.value,
                builder: (data) {
                  return Column(
                    children: [
                      Center(
                        child: Text(
                          data?.name ?? "",
                          style: context.textTheme.titleLarge,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 16,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.pin_drop,
                              color: AppColors.i.primaryColor,
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                data?.address ?? "",
                                style: context.textTheme.bodyLarge,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 16,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.phone, color: AppColors.i.primaryColor),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                data?.phone ?? "",
                                style: context.textTheme.bodyLarge,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              );
            }),
            Divider(),
            Watch((context) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 16,
                ),
                child: SignalFutureBuilder(
                  asyncState: controller.filtersAS.value,
                  builder: (data) {
                    return SizedBox(
                      height: 30,
                      child: ListView.separated(
                        clipBehavior: Clip.none,
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 16),
                        scrollDirection: Axis.horizontal,
                        itemCount: data?.length ?? 0,
                        itemBuilder: (context, index) {
                          final filter = data?[index];
                          return Watch((context) {
                            return InkWell(
                              borderRadius: BorderRadius.circular(20),
                              onTap: () {
                                controller.setSelectedFilter(filter);
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                ),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color:
                                      controller.selectedFilter.value?.slug ==
                                          filter?.slug
                                      ? context.primaryColor
                                      : Colors.transparent,
                                  border: Border.all(
                                    color: context.colorScheme.inverseSurface
                                        .withValues(alpha: 0.3),
                                    width: 1,
                                  ),
                                ),
                                child: Text(
                                  filter?.name ?? "",
                                  style: context.textTheme.titleLarge?.copyWith(
                                    fontSize: 12,
                                    color:
                                        controller.selectedFilter.value?.slug ==
                                            filter?.slug
                                        ? Colors.white
                                        : context.textTheme.titleLarge?.color,
                                  ),
                                ),
                              ),
                            );
                          });
                        },
                      ),
                    );
                  },
                ),
              );
            }),
            Divider(),
            Watch((context) {
              return SignalFutureBuilder(
                asyncState: controller.searchAS.value,
                builder: (data) {
                  return Expanded(
                    child: GridView.builder(
                      padding: EdgeInsets.all(16),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: 310,
                        crossAxisCount: 2,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                      ),
                      itemCount: data?.length ?? 0,
                      itemBuilder: (context, index) {
                        final product = data?[index];
                        return InkWell(
                          borderRadius: BorderRadius.circular(20),
                          onTap: () {
                            Modular.to.pushNamed(
                              Routes.productDetail,
                              arguments: product!.id,
                            );
                          },
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: context.colorScheme.inverseSurface
                                    .withValues(alpha: 0.3),
                                width: 1,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: CachedNetworkImage(
                                      height: 150,
                                      width: 150,
                                      fit: BoxFit.cover,
                                      imageUrl: product?.image ?? "",
                                      placeholder: (context, url) =>
                                          const Shimmer(
                                            gradient: LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                Colors.grey,
                                                Colors.white,
                                              ],
                                            ),
                                            child: SizedBox(
                                              width: 200,
                                              height: 200,
                                            ),
                                          ),
                                      errorWidget: (context, url, error) =>
                                          const Icon(
                                            Icons.error,
                                            color: Colors.grey,
                                          ),
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    product?.name ?? "",
                                    style: context.textTheme.bodyLarge,
                                  ),
                                  Text("por ${product?.unit}"),
                                  SizedBox(height: 4),
                                  Text(
                                    product?.price.toBRL() ?? "",
                                    style: context.textTheme.titleSmall
                                        ?.copyWith(
                                          color: context.colorScheme.primary,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  const SizedBox(height: 4),
                                  FilledButton(
                                    onPressed: () {},
                                    child: Text("Adicionar"),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
