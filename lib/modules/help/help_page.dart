import 'package:flutter/material.dart';

import '../../core/core.dart';
import 'help.dart';

 class HelpPage extends StatefulWidget {
  const HelpPage({super.key});

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends PageLifeCycleState<HelpController, HelpPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
