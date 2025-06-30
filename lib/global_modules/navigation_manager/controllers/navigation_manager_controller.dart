import 'package:signals/signals_flutter.dart';

import '../../../../core/core.dart';

class NavigationManagerController with ControllerLifeCycle {
  Signal<int> currentIndex = Signal(0);
}
