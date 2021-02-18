#import "WebrtcPlugin.h"
#if __has_include(<webrtc/webrtc-Swift.h>)
#import <webrtc/webrtc-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "webrtc-Swift.h"
#endif

@implementation WebrtcPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftWebrtcPlugin registerWithRegistrar:registrar];
}
@end
