import 'package:feira_na_palma/core/extensions/theme.dart';
import 'package:feira_na_palma/modules/modules.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:signals/signals_flutter.dart';

import '../../core/core.dart';
import 'producers.dart';

class ProducersPage extends StatefulWidget {
  const ProducersPage({super.key});

  @override
  State<ProducersPage> createState() => _ProducersPageState();
}

class _ProducersPageState
    extends PageLifeCycleState<ProducersController, ProducersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 16,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Produtores", style: context.textTheme.titleLarge),
              SearchInputField(
                controller: controller.searchController,
                onChanged: (value) {},
              ),
              Watch((context) {
                return SignalFutureBuilder(
                  asyncState: controller.searchAS.value,
                  builder: (data) {
                    return Expanded(
                      child: ListView.separated(
                        itemCount: data?.length ?? 0,
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 16),
                        itemBuilder: (context, index) {
                          final producer = data?[index];
                          return InkWell(
                            borderRadius: BorderRadius.circular(20),
                            onTap: () {
                              Modular.to.pushNamed(Routes.producerDetail);
                            },
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
                                    producer?.name ?? "",
                                    style: context.textTheme.titleSmall,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.pin_drop_outlined,
                                        color: context.colorScheme.primary,
                                      ),
                                      Text(
                                        producer?.address ?? "",
                                        style: context.textTheme.titleSmall
                                            ?.copyWith(
                                              color: context
                                                  .colorScheme
                                                  .inverseSurface
                                                  .withValues(alpha: 0.5),
                                            ),
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
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
