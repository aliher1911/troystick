//
//  AppDelegate.m
//  Troystick
//
//  Created by Oleg Afanasyev on 08/08/2016.
//  Copyright (c) 2016 Oleg Afanasyev. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;

@property (weak) IBOutlet NSButton *startButton;
@property (weak) IBOutlet NSButton *pauseButton;
@property (weak) IBOutlet NSButton *resumeButton;
@property (weak) IBOutlet NSButton *stopButton;
@property (weak) IBOutlet NSTableView *table;

@property NSTimer *refreshTimer;
@end

@implementation AppDelegate

- (IBAction)start:(id)sender {
    [[self startButton] setEnabled:FALSE];
    [[self pauseButton] setEnabled:TRUE];
    [[self resumeButton] setEnabled:FALSE];
    [[self stopButton] setEnabled:TRUE];
    [self setRefreshTimer:
     [NSTimer scheduledTimerWithTimeInterval:0.1
                                      target:self
                                    selector:@selector(refreshWorkPosition:)
                                    userInfo:nil
                                     repeats:YES]];
}

- (IBAction)stop:(id)sender {
    [[self startButton] setEnabled:TRUE];
    [[self pauseButton] setEnabled:FALSE];
    [[self resumeButton] setEnabled:FALSE];
    [[self stopButton] setEnabled:FALSE];
    [[self refreshTimer] invalidate];
    [self setRefreshTimer:nil];
}

- (IBAction)pause:(id)sender {
    [[self startButton] setEnabled:FALSE];
    [[self pauseButton] setEnabled:FALSE];
    [[self resumeButton] setEnabled:TRUE];
    [[self stopButton] setEnabled:TRUE];
    [[self refreshTimer] invalidate];
    [self setRefreshTimer:nil];
}

- (IBAction)resume:(id)sender {
    [[self startButton] setEnabled:FALSE];
    [[self pauseButton] setEnabled:TRUE];
    [[self resumeButton] setEnabled:FALSE];
    [[self stopButton] setEnabled:TRUE];
    [self setRefreshTimer:
     [NSTimer scheduledTimerWithTimeInterval:0.1
                                      target:self
                                    selector:@selector(refreshWorkPosition:)
                                    userInfo:nil
                                     repeats:YES]];
}


int x = 0;

- (void)refreshWorkPosition:(NSTimer *)timer {
    x++;
    [[self table] reloadData];
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)aTableView {
    return 6;
}

const char *labels[] = {
    "X", "Y", "Z", "Rx", "Ry", "Rz"
};

- (id)tableView:(NSTableView *)aTableView
objectValueForTableColumn:(NSTableColumn *)aTableColumn
            row:(NSInteger)rowIndex {
    if (aTableColumn == [[[self table] tableColumns] objectAtIndex:0]) {
        return [NSString stringWithUTF8String:labels[rowIndex]];
    } else {
        return [NSNumber numberWithLong:(10 + rowIndex + x)];
    }
}

- (BOOL)tabView:(NSTabView *)tabView shouldSelectTabViewItem:(NSTabViewItem *)tabViewItem {
    // if linuxtrack is active, prevent tab changes
    return FALSE;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
