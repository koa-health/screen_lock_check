#import "ScreenLockCheckPlugin.h"
#import <LocalAuthentication/LocalAuthentication.h>

@implementation ScreenLockCheckPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"screen_lock_check"
            binaryMessenger:[registrar messenger]];
  ScreenLockCheckPlugin* instance = [[ScreenLockCheckPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"isScreenLockEnabled" isEqualToString:call.method]) {
   LAContext *context = [LAContext new];
   NSError *error;
   BOOL isLockScreenEnabled = [context canEvaluatePolicy:LAPolicyDeviceOwnerAuthentication error:&error];
   if (error != nil) {
       result([FlutterError errorWithCode:@"UNAVAILABLE"
                                  message:@"Local authentication context is unavailable"
                                  details:nil]);
   } else if (isLockScreenEnabled) {
     result([NSNumber numberWithBool:YES]);
   } else {
     result([NSNumber numberWithBool:NO]);
   }
 } else {
   result(FlutterMethodNotImplemented);
 }
}

@end
