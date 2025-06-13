import 'android_native_settings_properties_platform_interface.dart';

class AndroidNativeSettingsProperties {
  Future<String?> getOption(String key) {
    return AndroidNativeSettingsPropertiesPlatform.instance.getOption(key);
  }
}
