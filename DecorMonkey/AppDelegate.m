//
//  AppDelegate.m
//  DecorMonkey
//
//  Created by Vance on 9/22/14.
//  Copyright (c) 2014 Torrential Scoffware. All rights reserved.
//

#import "AppDelegate.h"

CGSDebugOptions options;

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)awakeFromNib {
    _statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    
    NSImage *menuIcon = [NSImage imageNamed:@"MenuIcon"];
    NSImage *highlightIcon = [NSImage imageNamed:@"MenuIcon"];
    
    [highlightIcon setTemplate:YES];
    
    [[self statusItem] setImage:menuIcon];
    [[self statusItem] setAlternateImage:highlightIcon];
    [[self statusItem] setMenu:[self menu]];
    [[self statusItem] setHighlightMode:YES];
}

- (IBAction)toggleDropshadow:(id)sender {
    NSLog(@"toggleDropshadow:");
    [sender setState:[sender state] == NSOffState ? NSOnState : NSOffState];
    if ([sender state] == NSOffState) {
        options = kCGSDebugOptionNone;
        CGSSetDebugOptions(options);
    }
    if([sender state] == NSOnState) {
        options = kCGSDebugOptionNoShadows;
        CGSSetDebugOptions(options);
    }
}

- (IBAction)terminate:(id)sender {
    NSLog(@"terminate:");
    [[NSApplication sharedApplication] terminate:nil];
}

- (BOOL)validateMenuItem:(NSMenuItem *)menuItem {
    if([[menuItem title] isEqualToString:@"Disable Dropshadow"]) {
        CGSGetDebugOptions(&options);
        if(options == kCGSDebugOptionNoShadows) {
            [menuItem setState: NSOnState];
        }
    }
    return YES;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
