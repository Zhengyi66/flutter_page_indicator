#import "PageviewIndicatorPluginsPlugin.h"
#import <pageview_indicator_plugins/pageview_indicator_plugins-Swift.h>

@implementation PageviewIndicatorPluginsPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftPageviewIndicatorPluginsPlugin registerWithRegistrar:registrar];
}
@end
