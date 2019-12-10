#import "FlutterPageIndicatorPlugin.h"
#import <flutter_page_indicator/flutter_page_indicator-Swift.h>

@implementation FlutterPageIndicatorPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterPageIndicatorPlugin registerWithRegistrar:registrar];
}
@end
