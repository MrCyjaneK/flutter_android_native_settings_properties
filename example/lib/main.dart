import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:android_native_settings_properties/android_native_settings_properties.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _adbWifiEnabled = 'Unknown';
  String _adbEnabled = 'Unknown';
  final _androidNativeSettingsPropertiesPlugin =
      AndroidNativeSettingsProperties();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String adbWifiEnabled;
    String adbEnabled;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      adbWifiEnabled = await _androidNativeSettingsPropertiesPlugin
              .getOption("adb_wifi_enabled") ??
          'Unknown platform version';
    } on PlatformException {
      adbWifiEnabled = 'Failed to get platform version.';
    }

    try {
      adbEnabled = await _androidNativeSettingsPropertiesPlugin
              .getOption("adb_enabled") ??
          'Unknown platform version';
    } on PlatformException {
      adbEnabled = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _adbWifiEnabled = adbWifiEnabled;
      _adbEnabled = adbEnabled;
    });
    print(_adbWifiEnabled);
    print(_adbEnabled);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text(
              'adb_wifi_enabled: $_adbWifiEnabled\nadb_enabled: $_adbEnabled'),
        ),
      ),
    );
  }
}
