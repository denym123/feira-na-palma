import 'dart:developer';

import '../core.dart';

class ExceptionHandler {
  final Object error;
  final StackTrace? stackTrace;

  ExceptionHandler(this.error, this.stackTrace) {
    log('==================================================================');
    log('============================= ERROR ==============================');
    log('==================================================================');
    log(error.toString());
    log(stackTrace.toString());

    GlobalException(error, stackTrace);
  }
}
