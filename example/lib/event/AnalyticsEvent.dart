import 'package:plugin_umeng_analytics/plugin_umeng_analytics.dart';
class AnalyticsEvent {

    //计算事件
    static void postCalcEvent() {

        PluginUmengAnalytics.analyticEvent('Click', {'age': '10', 'name': 'xiaowei'});
    }

    //统计事件
    static void postStatisticsEvent() {

        PluginUmengAnalytics.analyticEvent('Click2', {'age': '110', 'name': 'zhangsan'}, extra: 5000);
    }

    static void postPageEvent(String pageId, bool visible) {

        PluginUmengAnalytics.analyticPage(pageId, visible);
    }
}