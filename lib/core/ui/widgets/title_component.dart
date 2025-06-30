import 'package:feira_na_palma/core/extensions/theme.dart';
import 'package:flutter/material.dart';

class TitleComponent extends StatelessWidget {
  final String title;
  const TitleComponent({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(title, style: context.textTheme.titleLarge);
  }
}
