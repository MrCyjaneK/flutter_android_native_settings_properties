import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'android_native_settings_properties_platform_interface.dart';

class MethodChannelAndroidNativeSettingsProperties
    extends AndroidNativeSettingsPropertiesPlatform {
  @visibleForTesting
  final methodChannel =
      const MethodChannel('android_native_settings_properties');

  @override
  Future<String?> getOption(String key) async {
    if (!Platform.isAndroid) return null;
    try {
      final value =
          await methodChannel.invokeMethod<String>('getOption', {'key': key});
      return value;
    } on PlatformException catch (e) {
      debugPrint("Failed to get option: $e");
      return null;
    }
  }
}
