# android_native_settings_properties

> Get native android setting values from flutter

## Usage

In your `pubspec.yaml`

```yaml
dependencies:
  android_native_settings_properties:
    git:
      url: https://github.com/mrcyjanek/flutter_android_native_settings_properties
      ref: master
```

```dart
final settings = MethodChannelAndroidNativeSettingsProperties();
final adbWifiEnabled = await settings.getOption('adb_wifi_enabled') ?? "0"; // returns null on error or non-android platforms
```

For a full list of keys see android source code: https://cs.android.com/android/platform/superproject/main/+/main:frameworks/base/core/java/android/provider/Settings.java