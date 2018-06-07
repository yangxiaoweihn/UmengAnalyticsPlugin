import 'dart:async';

import 'package:flutter/services.dart';

import 'plugin/analytics/LLog.dart';

class PluginUmengAnalytics {
    static const MethodChannel _channel = const MethodChannel('plugin_umeng_analytics');

    static void analyticEvent(String eventId, Map<String, String> param, {int extra}) {

        Map<String, Object> data = {
            'debug': LLog.debug,
            'event': eventId, 
            'param': param, 
            'extra': extra,
        };
        _channel.invokeMethod('onEvent', data);
    }
}