#import "PluginUmengAnalyticsPlugin.h"
#import <plugin_umeng_analytics/plugin_umeng_analytics-Swift.h>

@implementation PluginUmengAnalyticsPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftPluginUmengAnalyticsPlugin registerWithRegistrar:registrar];
}
@end
