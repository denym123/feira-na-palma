import 'package:feira_na_palma/core/extensions/theme.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../core/core.dart';
import 'splash.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState
    extends PageLifeCycleState<SplashController, SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LoadingAnimationWidget.progressiveDots(
          color: context.primaryColor,
          size: 120,
        ),
      ),
    );
  }
}
