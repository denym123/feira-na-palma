import 'package:feira_na_palma/core/extensions/theme.dart';
import 'package:feira_na_palma/core/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

class FilterSkeleton extends StatelessWidget {
  const FilterSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultShimmer(
      child: SizedBox(
        height: 30,
        child: ListView.separated(
          clipBehavior: Clip.none,
          separatorBuilder: (context, index) => const SizedBox(width: 16),
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          itemBuilder: (context, index) {
            return Container(
              width: 90,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey,
                border: Border.all(color: Colors.grey, width: 1),
              ),
              child: Text(
                "",
                style: context.textTheme.titleLarge?.copyWith(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
