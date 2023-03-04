import 'dart:developer';

import 'package:wayo/configs/constants.dart';

class CustomException implements Exception {
  late ExceptionCode code;
  late String message;

  CustomException({
    this.code = ExceptionCode.UNKNOWN,
    this.message = 'An unknown error occurred',
  }) {
    log('[Custom Exception]: $message');
  }
}
