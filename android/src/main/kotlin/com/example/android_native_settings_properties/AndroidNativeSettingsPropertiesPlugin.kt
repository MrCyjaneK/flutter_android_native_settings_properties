package com.example.android_native_settings_properties

import android.content.ContentResolver
import android.content.Context
import android.provider.Settings
import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

class AndroidNativeSettingsPropertiesPlugin : FlutterPlugin, MethodCallHandler {
  private lateinit var channel: MethodChannel
  private lateinit var context: Context

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "android_native_settings_properties")
    channel.setMethodCallHandler(this)
    context = flutterPluginBinding.applicationContext
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    if (call.method == "getOption") {
      val key = call.argument<String>("key")
      if (key != null) {
        try {
          val resolver: ContentResolver = context.contentResolver
          val value = Settings.Global.getString(resolver, key)
          result.success(value)
        } catch (e: Exception) {
          result.error("ERROR", "Failed to get setting: ${e.message}", null)
        }
      } else {
        result.error("INVALID_ARGUMENT", "Key is null", null)
      }
    } else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
