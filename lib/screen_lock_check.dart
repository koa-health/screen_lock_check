import 'dart:async';

import 'package:flutter/services.dart';

class ScreenLockCheck {
  static const MethodChannel _channel = const MethodChannel('screen_lock_check');

  static Future<bool> get isScreenLockEnabled async {
    // TO DO: should this param to invokeMethod be camelCase?
    final bool isScreenLockEnabled = await _channel.invokeMethod('isScreenLockEnabled');
    return isScreenLockEnabled;
  }
}
