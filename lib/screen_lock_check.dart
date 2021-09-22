import 'dart:async';

import 'package:flutter/services.dart';

class ScreenLockCheck {
  static const MethodChannel _channel =
      const MethodChannel('screen_lock_check');

  static Future<bool> get isScreenLockEnabled async {
    final bool isScreenLockEnabled =
        await _channel.invokeMethod('isScreenLockEnabled');
    return isScreenLockEnabled;
  }
}
