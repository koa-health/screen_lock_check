import 'dart:async';

import 'package:flutter/services.dart';

/// This allows you to check whether the user has a form
/// of local authentication enabled on their device to lock
/// their screen to other users:
/// a passcode, a pattern lock, face id or touch id.
/// This can help you to establish how secure the device is.

class ScreenLockCheck {
  static const MethodChannel _channel = const MethodChannel('screen_lock_check');

  /// Returns [true] if the user has some form of screen lock (lock screen)
  /// enabled on their device
  Future<bool> get isScreenLockEnabled async {
    final bool isScreenLockEnabled = await _channel.invokeMethod('isScreenLockEnabled');
    return isScreenLockEnabled;
  }
}
