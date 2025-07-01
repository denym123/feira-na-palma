import 'package:cached_network_image/cached_network_image.dart';
import 'package:feira_na_palma/core/extensions/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shimmer/shimmer.dart';
import 'package:signals/signals_flutter.dart';

import '../../core/core.dart';
import 'home.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends PageLifeCycleState<HomeController, HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TitleComponent(title: "Feira na Palma"),
            SearchInputField(
              controller: controller.searchController,
              onChanged: (text) {
                controller.search();
              },
            ),
            Watch((context) {
              return SignalFutureBuilder(
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
              );
            }),
            Watch((context) {
              return SignalFutureBuilder(
                asyncState: controller.searchAS.value,
                builder: (data) {
                  return Expanded(
                    child: GridView.builder(
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
                              Routes.producerDetail,
                              arguments: product!.producerId,
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
