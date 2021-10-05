import 'package:flutter/material.dart';
import 'dart:async';

import 'package:screen_lock_check/screen_lock_check.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isScreenLockEnabled;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    bool isScreenLockEnabled;

    try {
      isScreenLockEnabled = await ScreenLockCheck().isScreenLockEnabled;
    } catch (e) {
      print('Error checking screen lock enabled: $e');
    }

    if (!mounted) return;

    setState(() {
      _isScreenLockEnabled = isScreenLockEnabled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppLifecycleEventHandler(
      setIsScreenLockEnabled: (val) {
        setState(() {
          _isScreenLockEnabled = val;
        });
      },
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Plugin example app'),
          ),
          body: Center(
            child: Text('Is screen lock enabled?: $_isScreenLockEnabled\n'),
          ),
        ),
      ),
    );
  }
}

class AppLifecycleEventHandler extends StatefulWidget {
  final Widget child;
  final ValueSetter setIsScreenLockEnabled;

  const AppLifecycleEventHandler({
    @required this.child,
    @required this.setIsScreenLockEnabled,
    Key key,
  }) : super(key: key);

  @override
  _AppLifecycleEventHandlerState createState() => _AppLifecycleEventHandlerState();
}

class _AppLifecycleEventHandlerState extends State<AppLifecycleEventHandler>
    with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      final isScreenLockEnabled = await ScreenLockCheck().isScreenLockEnabled;
      widget.setIsScreenLockEnabled(isScreenLockEnabled);
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
