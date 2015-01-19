//
//  AppDelegate.h
//  DecorMonkey
//
//  Created by Vance on 9/22/14.
//  Copyright (c) 2014 Torrential Scoffware. All rights reserved.
//

#import <Cocoa/Cocoa.h>

typedef enum _CGSDebugOptions {
    kCGSDebugOptionNone,
    kCGSDebugOptionNoShadows = 0x4000
} CGSDebugOptions;

extern void CGSGetDebugOptions(CGSDebugOptions *options);
extern void CGSSetDebugOptions(CGSDebugOptions options);

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (readwrite, retain) IBOutlet NSMenu *menu;
@property (readwrite, retain) IBOutlet NSStatusItem *statusItem;

- (IBAction)toggleDropshadow:(id)sender;
- (IBAction)terminate:(id)sender;

@end

