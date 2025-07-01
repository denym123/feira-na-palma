import 'package:feira_na_palma/core/core.dart';
import 'package:flutter/material.dart';

class ProducerInfoSkeleton extends StatelessWidget {
  const ProducerInfoSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultShimmer(
      child: Expanded(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            children: [
              Container(
                height: 24,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 16),
              Container(
                height: 14,
                width: 450,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 8),
              Container(
                height: 14,
                width: 450,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
