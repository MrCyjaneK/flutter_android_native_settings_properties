import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'android_native_settings_properties_method_channel.dart';

abstract class AndroidNativeSettingsPropertiesPlatform
    extends PlatformInterface {
  /// Constructs a AndroidNativeSettingsPropertiesPlatform.
  AndroidNativeSettingsPropertiesPlatform() : super(token: _token);

  static final Object _token = Object();

  static AndroidNativeSettingsPropertiesPlatform _instance =
      MethodChannelAndroidNativeSettingsProperties();

  static AndroidNativeSettingsPropertiesPlatform get instance => _instance;

  static set instance(AndroidNativeSettingsPropertiesPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getOption(String key) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
