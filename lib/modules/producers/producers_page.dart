import 'package:flutter/material.dart';

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
    return const Scaffold();
  }
}
