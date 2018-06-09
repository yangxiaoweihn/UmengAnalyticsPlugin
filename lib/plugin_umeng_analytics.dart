import 'dart:async';

import 'package:flutter/services.dart';

import 'plugin/analytics/LLog.dart';

//Created by yangxiaowei
class PluginUmengAnalytics {
    static const MethodChannel _channel = const MethodChannel('plugin_umeng_analytics');

    static void analyticEvent(String eventId, Map<String, String> param, {int extra}) {

        Map<String, dynamic> data = {
            'debug': LLog.debug,
            'event': eventId, 
            'param': param, 
            'extra': extra,
        };
        _channel.invokeMethod('onAnalyticsEvent', data);
    }

    static void analyticPage(String pageId, bool visible) {

        Map<String, dynamic> data = {
            'debug': LLog.debug,
            'page': pageId, 
            'visible': visible, 
        };
        _channel.invokeMethod('onAnalyticsPage', data);
    }
}