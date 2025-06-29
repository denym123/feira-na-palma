import 'package:flutter_modular/flutter_modular.dart';

class GlobalException implements Exception {
  Object error;
  StackTrace? stackTrace;

  GlobalException(this.error, this.stackTrace) {
    error = {
      'route': Modular.routerDelegate.path,
      'error': error.toString(),
      'stackTrace': stackTrace.toString(),
    };
  }
}
