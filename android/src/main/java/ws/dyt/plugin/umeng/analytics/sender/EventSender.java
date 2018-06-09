package ws.dyt.plugin.umeng.analytics.sender;

import android.content.Context;
import android.text.TextUtils;

import com.umeng.analytics.MobclickAgent;

import java.util.Map;

import ws.dyt.plugin.umeng.analytics.log.LLog;

/**
 * Created by yangxiaowei at 2018/06/07
 *
 * 统计事件发送
 */
public class EventSender {
    private static final String TAG = EventSender.class.getSimpleName();

    /**
     * 统计事件发送
     * @param context
     * @param eventId
     * @param param
     * @param extra
     */
    public static void handleEvent(Context context, String eventId, Map<String, String> param, String extra) {
        LLog.d(TAG, "eventId: "+eventId+" , param: "+param+" , extra: "+extra);
        if (TextUtils.isEmpty(extra)) {
            //计数事件
            MobclickAgent.onEvent(context, eventId, param);
        }else {
            //统计事件|计算事件
            MobclickAgent.onEventValue(context, eventId, param, Integer.valueOf(extra));
        }
    }

    /**
     * 页面记录
     * @param pageId
     * @param visible
     */
    public static void handlePage(String pageId, boolean visible) {
        LLog.d(TAG, "pageId: "+pageId+" , visible: "+visible);
        if (visible) {

            MobclickAgent.onPageStart(pageId);
        }else {

            MobclickAgent.onPageEnd(pageId);
        }
    }
}
