import 'package:feira_na_palma/core/extensions/theme.dart';
import 'package:feira_na_palma/core/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ProductSkeletonGrid extends StatelessWidget {
  const ProductSkeletonGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultShimmer(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: 350,
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
        ),
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: context.colorScheme.inverseSurface.withValues(
                  alpha: 0.3,
                ),
                width: 1,
              ),
            ),
          );
        },
      ),
    );
  }
}
