import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:screen_lock_check/screen_lock_check.dart';

void main() {
  const MethodChannel channel = MethodChannel('screen_lock_check');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('isScreenLockEnabled', () async {
    expect(await ScreenLockCheck.isScreenLockEnabled, '42');
  });
}
