#import "DynamicFormsPlugin.h"
#import <dynamic_forms/dynamic_forms-Swift.h>

@implementation DynamicFormsPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftDynamicFormsPlugin registerWithRegistrar:registrar];
}
@end
