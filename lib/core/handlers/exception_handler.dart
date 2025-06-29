import 'dart:developer';

import 'package:flutter/foundation.dart';

import '../core.dart';

class ExceptionHandler {
  final Object error;
  final StackTrace? stackTrace;
  final String _defaultErrorMessage =
      'Não foi possível realizar essa operação no momento.\nTente novamente mais tarde.';

  ExceptionHandler(this.error, this.stackTrace) {
    log('==================================================================');
    log('============================= ERROR ==============================');
    log('==================================================================');
    log(error.toString());
    log(stackTrace.toString());

    GlobalException(error, stackTrace);
  }
}
