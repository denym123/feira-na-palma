import 'package:flutter/material.dart';

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  TextTheme get textTheme => Theme.of(this).textTheme;

  Color get primaryColor => colorScheme.primary;

  Color get secondaryColor => colorScheme.secondary;

  Color get backgroundColor => theme.scaffoldBackgroundColor;

  Color get surfaceColor => colorScheme.surface;
}
