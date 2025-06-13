// This is a basic Flutter integration test.
//
// Since integration tests run in a full Flutter application, they can interact
// with the host side of a plugin implementation, unlike Dart unit tests.
//
// For more information about Flutter integration tests, please see
// https://flutter.dev/to/integration-testing

import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:android_native_settings_properties/android_native_settings_properties.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('getOption(adb_wifi_enabled) test', (WidgetTester tester) async {
    final AndroidNativeSettingsProperties plugin =
        AndroidNativeSettingsProperties();
    final String? adbWifiEnabled = await plugin.getOption('adb_wifi_enabled');
    print("adbWifiEnabled: $adbWifiEnabled");
    expect(adbWifiEnabled?.isNotEmpty, true);
  });

  testWidgets('getOption(adb_enabled) test', (WidgetTester tester) async {
    final AndroidNativeSettingsProperties plugin =
        AndroidNativeSettingsProperties();
    final String? adbEnabled = await plugin.getOption('adb_enabled');
    print("adbEnabled: $adbEnabled");
    expect(adbEnabled?.isNotEmpty, true);
  });
}
