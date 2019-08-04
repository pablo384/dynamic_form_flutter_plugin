#import "DynamicFormsComunityPlugin.h"
#import <dynamic_forms_comunity/dynamic_forms_comunity-Swift.h>

@implementation DynamicFormsComunityPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftDynamicFormsComunityPlugin registerWithRegistrar:registrar];
}
@end
