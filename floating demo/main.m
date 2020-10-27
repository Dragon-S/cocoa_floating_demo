//
//  main.m
//  floating demo
//
//  Created by SpringHack on 2020/10/28.
//

#import <Cocoa/Cocoa.h>
#import "AppDelegate.h"

int main(int argc, const char* argv[]) {
  @autoreleasepool {
    // Setup code that might create autoreleased objects goes here.
    AppDelegate* delegate = [[AppDelegate alloc] init];
    NSApplication* application = [NSApplication sharedApplication];
    [application setDelegate:delegate];
    [application run];
  }
  return EXIT_SUCCESS;
}
