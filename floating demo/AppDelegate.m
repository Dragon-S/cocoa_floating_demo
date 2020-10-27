//
//  AppDelegate.m
//  floating demo
//
//  Created by SpringHack on 2020/10/28.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate {
  NSMutableArray* windows_;
}

- (void)applicationDidFinishLaunching:(NSNotification*)aNotification {
  // Insert code here to initialize your application

  // Init windows array
  windows_ = [[NSMutableArray alloc] init];

  // Create windows for every screen
  for (NSScreen* screen in [NSScreen screens]) {
    // Window size
    NSRect frame = [screen frame];
    frame.origin.x += 200;
    frame.origin.y += 200;
    frame.size.width /= 2;
    frame.size.height /= 2;

    // Create window
    NSWindow* window = [[NSPanel alloc]
        initWithContentRect:frame
                  styleMask:NSWindowStyleMaskTitled |
                            NSWindowStyleMaskNonactivatingPanel  // the most important mask
                    backing:NSBackingStoreBuffered
                      defer:YES
                     screen:screen];

    // Set window space behavior
    [window setCollectionBehavior:NSWindowCollectionBehaviorCanJoinAllSpaces |
                                  NSWindowCollectionBehaviorFullScreenAuxiliary];

    // Set window level
    [window setLevel:CGShieldingWindowLevel()];

    // Some demo code to make window transparent
    [window setOpaque:NO];
    [window setBackgroundColor:[NSColor colorWithDeviceRed:0.0 green:1.0 blue:0.0 alpha:0.1]];

    // Make window on the top
    [window orderFrontRegardless];

    // Add to array to keep reference
    [windows_ addObject:window];
  }
}

- (void)applicationWillTerminate:(NSNotification*)aNotification {
  // Insert code here to tear down your application
  NSLog(@"%@", windows_);
}

@end
