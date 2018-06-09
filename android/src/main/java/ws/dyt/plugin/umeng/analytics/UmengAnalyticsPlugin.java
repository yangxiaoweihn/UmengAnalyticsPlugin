package ws.dyt.plugin.umeng.analytics;

import java.util.Map;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;
import ws.dyt.plugin.umeng.analytics.log.LLog;
import ws.dyt.plugin.umeng.analytics.sender.EventSender;

/**
 * UmengAnalyticsPlugin
 * 
 * Created by yangxiaowei
 */
public class UmengAnalyticsPlugin implements MethodCallHandler {
    private static String TAG = UmengAnalyticsPlugin.class.getSimpleName();

    public static void registerWith(Registrar registrar) {
        final MethodChannel channel = new MethodChannel(registrar.messenger(), "plugin_umeng_analytics");
        channel.setMethodCallHandler(new UmengAnalyticsPlugin(registrar));
    }

    private Registrar registrar;

    public UmengAnalyticsPlugin(Registrar registrar) {
        this.registrar = registrar;
    }

    @Override
    public void onMethodCall(MethodCall call, Result result) {
        if (null == registrar) {
            LLog.e(TAG, "Registrar obj is null. return");
            return;
        }

        boolean debug = call.hasArgument("debug") && (boolean) call.argument("debug");
        LLog.setDebug(debug);

        if (this.dispatchAnalyticsByMethod(call, result)) {

            result.success("");
        } else {

            result.notImplemented();
        }
    }

    private boolean dispatchAnalyticsByMethod(MethodCall call, Result result) {
        final String method = call.method;
        boolean handled = true;
        if (method.equals("onAnalyticsEvent")) {

            this.handleAnalyticsEvent(call, result);
        } else if (method.equals("onAnalyticsPage")) {

            this.handleAnalyticsPage(call, result);
        }else {

            handled = false;
        }

        return handled;
    }

    /**
     * 统计事件
     * @param call
     * @param result
     */
    @SuppressWarnings("unchecked")
    private void handleAnalyticsEvent(MethodCall call, Result result) {

        final String eventId = call.hasArgument("event") ? (String) call.argument("event") : null;
        final Map<String, String> param = call.hasArgument("param") ? (Map<String, String>) call.argument("param") : null;
        final Integer extra = call.hasArgument("extra") ? (Integer) call.argument("extra") : null;

        EventSender.handleEvent(registrar.context(), eventId, param, extra == null ? null : extra.toString());
    }

    /**
     * 统计页面
     * @param call
     * @param result
     */
    private void handleAnalyticsPage(MethodCall call, Result result) {

        final String pageId = call.hasArgument("page") ? (String) call.argument("page") : null;
        final boolean visible = call.hasArgument("visible") && (boolean) call.argument("visible");

        EventSender.handlePage(pageId, visible);
    }
}
