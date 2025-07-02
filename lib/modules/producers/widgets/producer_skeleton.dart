import 'package:feira_na_palma/core/extensions/theme.dart';
import 'package:feira_na_palma/core/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ProducerSkeleton extends StatelessWidget {
  const ProducerSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultShimmer(
      child: ListView.separated(
        itemCount: 4,
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
            child: Column(
              spacing: 8,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("", style: context.textTheme.titleMedium),
                Text(
                  "",
                  maxLines: 2,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: context.colorScheme.inverseSurface.withValues(
                      alpha: 0.5,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.pin_drop_outlined,
                      color: context.colorScheme.primary,
                    ),
                    Expanded(
                      child: Text(
                        "",
                        style: context.textTheme.titleSmall?.copyWith(
                          color: context.colorScheme.inverseSurface.withValues(
                            alpha: 0.5,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// Container(
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20),
//         border: Border.all(
//           color: context.colorScheme.inverseSurface.withValues(alpha: 0.3),
//           width: 1,
//         ),
//       ),
//       child: Column(
//         spacing: 8,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text("", style: context.textTheme.titleMedium),
//           Text(
//             "",
//             maxLines: 2,
//             style: context.textTheme.bodyMedium?.copyWith(
//               color: context.colorScheme.inverseSurface.withValues(alpha: 0.5),
//             ),
//           ),
//           Row(
//             children: [
//               Icon(Icons.pin_drop_outlined, color: context.colorScheme.primary),
//               Expanded(
//                 child: Text(
//                   "",
//                   style: context.textTheme.titleSmall?.copyWith(
//                     color: context.colorScheme.inverseSurface.withValues(
//                       alpha: 0.5,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
