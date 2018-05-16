import 'dart:async';

import 'package:flutter/services.dart';

class PluginUmengAnalytics {
  static const MethodChannel _channel =
      const MethodChannel('plugin_umeng_analytics');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
