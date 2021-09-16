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
      isScreenLockEnabled = await ScreenLockCheck.isScreenLockEnabled;
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
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Is screen lock enabled?: $_isScreenLockEnabled\n'),
        ),
      ),
    );
  }
}
