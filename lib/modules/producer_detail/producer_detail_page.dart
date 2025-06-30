import 'package:feira_na_palma/core/extensions/theme.dart';
import 'package:flutter/material.dart';

import '../../core/core.dart';
import 'producer_detail.dart';

class ProducerDetailPage extends StatefulWidget {
  const ProducerDetailPage({super.key});

  @override
  State<ProducerDetailPage> createState() => _ProducerDetailPageState();
}

class _ProducerDetailPageState
    extends PageLifeCycleState<ProducerDetailController, ProducerDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(
            child: Column(
              children: [
                Text("Nome", style: context.textTheme.titleMedium),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.star, color: AppColors.i.warningColor),
                    Text(
                      "4.5",
                      style: context.textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text("Nome", style: context.textTheme.bodyLarge),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
